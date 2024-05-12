import 'package:food_delivery_app/pages/auth/sign_in_page.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food_details/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food_details/recommended_food_detail.dart';
import 'package:food_delivery_app/pages/home/home_page.dart';
import 'package:food_delivery_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  // static const String addAddress = "/add-address";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';
  // static String getAddressPage() => '$addAddress';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashPage()),

    GetPage(
      name: initial,
      page: () {
        Get.log('Initial page is callled...................');
        return HomePage();
      },
    ),

    GetPage(
      name: signIn,
      page: () {
        return SignInPage();
      },
      transition: Transition.fade,
    ),

    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        Get.log('................popular food detail page is called');

        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        Get.log('................recommended food detail page is called');

        return RecommendedFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),

    // cart page

    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),

    // GetPage(
    //     name: addAddress,
    //     page: () {
    //       return AddAddressPage();
    //     })
  ];
}
