import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:shopping_store/common/widgets/layouts/grid_layout.dart';
// import 'package:shopping_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopping_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopping_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:shopping_store/utils/helpers/cloud_helper_functions.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    
    return Scaffold(
      appBar: HkAppBar(title: Text(title), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Check the state of FutureBuilder snapshot
              const loader = HkVerticalProductShimmer();
              final widget = HkCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

              // Return appropriate widget based on snapshot state
              if(widget != null) return widget;

              // Products Found
              final products = snapshot.data!;

              return HkSortableProducts(products: products,);
            }
          ),
        ),
      ),
    );
  }
}

