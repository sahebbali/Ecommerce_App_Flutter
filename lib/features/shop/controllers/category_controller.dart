




import 'package:get/get.dart';
// import 'package:shopping_store/data/dummy_data.dart';
import 'package:shopping_store/data/repositories/categories/category_repository.dart';
import 'package:shopping_store/data/repositories/product_repository.dart';
import 'package:shopping_store/features/shop/models/product_model.dart';
import 'package:shopping_store/utils/helpers/helper_functions.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();


  /// Variables
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxBool isLoading = false.obs;
  final categoryRepository = Get.put(CategoryRepository());


  @override
  void onInit() {

    //categoryRepository.uploadDummyData(HkDummyData.categories);
    fetchCategories();

    super.onInit();
  }

  /// Load Category Data
  Future<void> fetchCategories() async{

    try{
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch Categories from data source (Firebase, API, etc)
      final categories = await categoryRepository.getAllCategories();

      // Update Rx Categories List
      allCategories.assignAll(categories);

      // Filter Featured Categories
      featuredCategories.assignAll(categories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch(e){
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// Load Selected Category Data
 Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    try{

      final subCategories = await categoryRepository.getSubCategories(categoryId);
      return subCategories;

    }catch(e){
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
 }

  /// Get Category or Sub_Category Products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async{
    try{
      final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    }catch(e){
      HkHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}