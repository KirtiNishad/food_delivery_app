import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  /*
  factor (x)
  screen size = 890.2857142857143 
  container size = 220
  factor = 890.2857142857143/220 = 4.04
   */

  static double pageViewContainer = screenHeight / 4.04;

  /*
  screen size = 890.2857142857143 
  container size = 120
  factor = 890.2857142857143/120 = 7.41
  */
  static double pageViewTextContainer = screenHeight / 6.59;
  static double pageView = screenHeight / 2.78;

  static double height10 = screenHeight / 89.0;
  static double height15 = screenHeight / 59.3;
  static double height20 = screenHeight / 44.5;
  static double height30 = screenHeight / 29.6;
  static double height40 = screenHeight / 22.2;
  static double height45 = screenHeight / 19.78;

  static double width10 = screenHeight / 89.0;
  static double width15 = screenHeight / 59.3;
  static double width20 = screenHeight / 44.5;
  static double width30 = screenHeight / 29.6;
  static double width40 = screenHeight / 22.2;
  static double width45 = screenHeight / 19.78;

  //FONT SIZE
  static double font16 = screenHeight / 55.6;
  static double font20 = screenHeight / 44.5;
  static double font26 = screenHeight / 34.2;

  static double radius15 = screenHeight / 59.35;
  static double radius20 = screenHeight / 44.5;
  static double radius30 = screenHeight / 29.6;

  // ICON SIZE
  static double iconSize = screenHeight / 37.0; //size = 24
  static double iconSize16 = screenHeight / 55.6;

  // LIST VIEW SIZE
  static double listViewImageSize = screenHeight / 7.41;
  static double listViewContainerSize = screenHeight / 8.90;

  // POPULAR FOOD
  static double popularFoodImgSize = screenHeight / 2.54;

  //BOTTOM HEIGHT
  static double bottomHeight = screenHeight / 7.41;

  //splash screen Dimension

  static double spalshImg = screenHeight / 3.38;
}
