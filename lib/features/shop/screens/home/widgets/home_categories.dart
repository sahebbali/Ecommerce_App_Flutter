import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_store/common/widgets/shimmer/category_shimmer.dart';
import 'package:shopping_store/features/shop/controllers/category_controller.dart';
import 'package:shopping_store/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class HkHomeCategories extends StatelessWidget {
  const HkHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      if(controller.isLoading.value) return const HkCategoryShimmer();

      if(controller.featuredCategories.isEmpty){
        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }else{
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.featuredCategories.length,
            itemBuilder: (context, index) {
              final category = controller.featuredCategories[index];
              return HkVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
              );
            },
          ),
        );
      }

    });
  }
}
