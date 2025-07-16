
import 'package:get/get.dart';
import 'package:shopping_store/features/shop/controllers/product/variation_controller.dart';
import 'package:shopping_store/utils/helpers/network_manager.dart';

import '../features/personalization/controllers/address_controller.dart';
import '../features/shop/controllers/product/checkout_controller.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());

  }
}