import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/Dimension.dart';
import 'package:food_delivery_app/widget/app_icon.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  // final String page;
  const RecommendedFoodDetail({
    super.key,
    required this.pageId,
    // required this.page,
  });

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    Get.log('page id is.........................: ' + pageId.toString());
    Get.log('food name is...................' + product.name.toString());

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // clear Icon
                GestureDetector(
                  // onTap: () {
                  // if (page == 'cartPage') {
                  //   Get.toNamed(RouteHelper.getCartPage());
                  // } else {
                  //   Get.toNamed(RouteHelper.getInitial());
                  // }
                  // },

                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcon(icon: Icons.clear),
                ),

                // cart icon
                GetBuilder<PopularProductController>(
                  builder: (product) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.cartPage);
                        // Get.to(() => CartPage());
                      },
                      child: Stack(
                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? const Positioned(
                                  top: 0,
                                  right: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  top: 3,
                                  right: 5,
                                  child: BigText(
                                    color: Colors.white,
                                    size: 12,
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    );
                  },
                )
              ],
            ),

            // details
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimension.height10 * 5),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height10 / 2, bottom: Dimension.height10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius20),
                    topRight: Radius.circular(Dimension.radius20),
                  ),
                ),
                width: double.maxFinite,
                child: Center(
                  child: BigText(
                    size: Dimension.font26,
                    text: product.name!,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URI + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
                  ),
                  child: ExpandableTextWidget(
                    text: product.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // bottom

      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimension.width20 * 2.5,
                  right: Dimension.width20 * 2.5,
                  top: Dimension.height10,
                  bottom: Dimension.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconSize: Dimension.iconSize,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.remove,
                      ),
                    ),
                    BigText(
                      color: AppColors.mainBlackColor,
                      size: Dimension.font26,
                      text: '\$ ${product.price!} X  ${controller.inCartItems}',
                      // text: '\$ ${product.price!} X ',
                      // text: 'abc',
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconSize: Dimension.iconSize,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.add,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: Dimension.bottomHeight,
                padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height30,
                  bottom: Dimension.height30,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius20 * 2),
                    topRight: Radius.circular(Dimension.radius20 * 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                          top: Dimension.height15,
                          bottom: Dimension.height15,
                          left: Dimension.width20,
                          right: Dimension.width20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        )),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimension.height15,
                          bottom: Dimension.height15,
                          left: Dimension.width20,
                          right: Dimension.width20,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                        ),
                        child: BigText(
                          text: '\$ ${product.price!} | Add to Cart',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
