import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_store/common/widgets/appbar/appbar.dart';
import 'package:shopping_store/common/widgets/icons/circular_icon.dart';
import 'package:shopping_store/common/widgets/layouts/grid_layout.dart';
import 'package:shopping_store/common/widgets/loaders/animation_loader.dart';
import 'package:shopping_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shopping_store/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shopping_store/features/shop/controllers/product/favourite_controller.dart';
import 'package:shopping_store/navigation_menu.dart';
import 'package:shopping_store/utils/constants/image_strings.dart';
import 'package:shopping_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
// import '../../models/product_model.dart';
import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: HkAppBar(
        title: Text('WishList', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          HkCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HkSizes.defaultSpace),

          /// Product Grid
          child: Obx(
            () => FutureBuilder(
                future: controller.favouriteProducts(),
                builder: (context, snapshot) {
                  /// Nothing found widget
                  final emptyWidget = HkAnimationLoader(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: HkImages.pencilAnimation,
                    showAction: true,
                    actionText: "Let's add some",
                    onActionPressed: () => Get.off(() => const NavigationMenu()),
                  );

                  /// Loading Widget
                  const loader = HkVerticalProductShimmer(
                    itemCount: 6,
                  );

                  final widget = HkCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;
                  return HkGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return HkProductCardVertical(
                        product: products[index],
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
