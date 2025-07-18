



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopping_store/data/services/firebase_storage_services.dart';
import 'package:shopping_store/features/shop/models/banner_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();


  /// Variables
  final _db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;


  /// Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async{
    try{

      final result = await _db.collection("Banners").where('Active',isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromDocument(documentSnapshot)).toList();

    } on FirebaseException catch(e){
      throw HkFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const HkFormatException();
    } on PlatformException catch(e){
      throw HkPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> uploadDummyBanners(List<BannerModel> banners) async{
    try{
      // final storage = Get.put(HkFirebaseStorageService());

      for(var banner in banners){

        // Get Uint8List of asset image
        final imageFile = await HkFirebaseStorageService().getImageDataFromAssets(banner.imageUrl);

        // Upload banner to Firebase Storage
        final imageUrl = await HkFirebaseStorageService().uploadImageData('Banners/', imageFile, DateTime.now().microsecondsSinceEpoch.toString());

        // Assign banner url to model
        banner.imageUrl = imageUrl;

        await _db.collection("Banners").doc().set(banner.toJson());

      }
    } on FirebaseException catch(e){
      throw HkFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw HkPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}