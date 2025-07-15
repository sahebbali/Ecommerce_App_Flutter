



import 'package:get/get.dart';
import 'package:shopping_store/features/authentication/screens/login/login.dart';
import 'package:shopping_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shopping_store/features/authentication/screens/password_configuration/forget_passwrod.dart';
import 'package:shopping_store/features/authentication/screens/signup/signup.dart';
import 'package:shopping_store/features/authentication/screens/signup/verify_email.dart';
import 'package:shopping_store/features/personalization/screens/address/address.dart';
import 'package:shopping_store/features/personalization/screens/profile/profile.dart';
import 'package:shopping_store/features/personalization/screens/settings/settings.dart';
import 'package:shopping_store/features/shop/screens/cart/cart.dart';
import 'package:shopping_store/features/shop/screens/checkout/checkout.dart';
import 'package:shopping_store/features/shop/screens/home/home.dart';
import 'package:shopping_store/features/shop/screens/order/order.dart';
import 'package:shopping_store/features/shop/screens/product_reviews/profuct_reviews.dart';
import 'package:shopping_store/features/shop/screens/store/store.dart';
import 'package:shopping_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:shopping_store/routes/routes.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: HkRoutes.home, page: () => const HomeScreen(),),
    GetPage(name: HkRoutes.store, page: () => const StoreScreen(),),
    GetPage(name: HkRoutes.favourites, page: () => const FavouriteScreen(),),
    GetPage(name: HkRoutes.settings, page: () => const SettingsScreen(),),
    GetPage(name: HkRoutes.productReviews, page: () => const ProductReviewsScreen(),),
    GetPage(name: HkRoutes.order, page: () => const OrdersScreen(),),
    GetPage(name: HkRoutes.checkout, page: () => const CheckoutScreen(),),
    GetPage(name: HkRoutes.cart, page: () => const CartScreen(),),
    GetPage(name: HkRoutes.userProfile, page: () => const ProfileScreen(),),
    GetPage(name: HkRoutes.userAddress, page: () => const UserAddressScreen(),),
    GetPage(name: HkRoutes.signup, page: () => const SignUpScreen(),),
    GetPage(name: HkRoutes.verifyEmail, page: () => const VerifyEmailScreen(),),
    GetPage(name: HkRoutes.signIn, page: () => const LoginScreen(),),
    GetPage(name: HkRoutes.forgetPassword, page: () => const ForgetPassScreen(),),
    GetPage(name: HkRoutes.onBoarding, page: () => const OnBoardingScreen(),),
    // add more as needed
  ];
}