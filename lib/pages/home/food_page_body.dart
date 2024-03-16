import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widget/app_column.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/icon_and_text.dart';
import 'package:food_delivery_app/widget/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(
          builder: (popularproducts) {
            return popularproducts.isLoaded
                ? Container(
                    margin: EdgeInsets.only(
                      left: Dimension.height10,
                      right: Dimension.height10,
                    ),
                    height: Dimension.pageView,
                    child: PageView.builder(
                      itemCount: popularproducts.popularProductList.length,
                      // itemCount: popularproducts.popularProductList.length.isEmpty
                      //     ? 1
                      //     : popularproducts.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _buildPageItem(
                            index, popularproducts.popularProductList[index]);
                      },
                    ),
                  )
                : const CircularProgressIndicator(color: AppColors.mainColor);
          },
        ),

        // dots
        // GetBuilder<PopularProductController>(builder: (popularProducts) {
        //   return DotsIndicator(
        //     dotsCount: popularProducts.popularProductList.isEmpty
        //         ? 1
        //         : popularProducts.popularProductList.length,
        //     position: _currPageValue.toInt(),
        //     decorator: DotsDecorator(
        //         activeColor: AppColors.mainColor,
        //         size: const Size.square(9.0),
        //         activeSize: const Size(18.0, 9.0),
        //         activeShape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(5),
        //         )),
        //   );
        // }),

        // recomended food
        SizedBox(height: Dimension.height30),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: "Recommended"),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),

        // list of recomended food and image
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProducts.recommendedProductList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                // onTap: (() => Get.to(() => RecommendedFoodDetail())),
                onTap: () {
                  Get.toNamed(RouteHelper.getRecommendedFood(index));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimension.width20,
                      right: Dimension.width20,
                      bottom: Dimension.height10),
                  child: Row(
                    children: [
                      //Image Section
                      Expanded(
                        child: Container(
                          // width: Dimension.listViewImageSize / 2,
                          height: Dimension.listViewImageSize,

                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                            color: const Color.fromARGB(97, 187, 46, 46),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                AppConstants.BASE_URL +
                                    "/uploads/" +
                                    recommendedProducts
                                        .recommendedProductList[index].img!,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //text Container
                      Expanded(
                        child: Container(
                          height: Dimension.listViewContainerSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimension.radius20),
                              bottomRight: Radius.circular(Dimension.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimension.width10,
                              right: Dimension.width10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                    text: recommendedProducts
                                        .recommendedProductList[index].name!),
                                SizedBox(
                                  height: Dimension.height10,
                                ),
                                SmallText(text: "With Indian characterstics"),
                                SizedBox(
                                  height: Dimension.height10,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // IconAndTextWidget(
                                    //   icon: Icons.circle_sharp,
                                    //   text: "Normal",
                                    //   iconColor: AppColors.iconColor1,
                                    // ),
                                    IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.3km",
                                      iconColor: AppColors.iconColor1,
                                    ),
                                    IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "28mins",
                                      iconColor: AppColors.iconColor1,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    return Stack(
      children: [
        GestureDetector(
          // onTap: (() => Get.to(() => PopularFoodDetail())),

          onTap: () {
            Get.toNamed(RouteHelper.getPopularFood(index, 'home'));
          },

          // Get.to() => used to navigate to a new screen or page similar to Navigator.push() method
          // Get.toNamed() => used to navigate to a named route, means navigate by referencing their names instead of the actual route paths.

          // image
          child: Container(
            height: Dimension.pageViewContainer,
            width: double.infinity,
            margin: EdgeInsets.only(
              left: Dimension.width10,
              right: Dimension.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URI +
                      popularProduct.img!,
                ),
              ),
            ),
          ),
        ),

        // details
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimension.pageViewTextContainer,
            margin: EdgeInsets.only(
              left: Dimension.width30,
              right: Dimension.width30,
              bottom: Dimension.height30,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimension.height15,
                  right: Dimension.width15,
                  top: Dimension.height15),
              child: AppColumn(text: popularProduct.name!),
            ),
          ),
        )
      ],
    );
  }
}
