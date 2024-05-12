import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';

import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widget/app_icon.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // top icon
          Positioned(
            top: Dimension.height20 * 3,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // arrow icon
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimension.iconSize,
                ),
                SizedBox(width: Dimension.width20 * 4),

                // total amount
                GetBuilder<CartController>(builder: (cartController) {
                  return Container(
                    padding: EdgeInsets.only(
                      top: Dimension.height10,
                      bottom: Dimension.height10,
                      left: Dimension.width20,
                      right: Dimension.width20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: Row(
                      children: [
                        const BigText(
                          text: "Total Amount :",
                          color: Colors.white,
                          size: 0,
                        ),
                        SizedBox(width: Dimension.width10),
                        BigText(
                          text: "'\$ ${cartController.totalAmount}'",
                          color: Colors.white,
                          size: 0,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),

          // list of items
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getItems.isNotEmpty
                ? Positioned(
                    top: Dimension.height20 * 6,
                    left: Dimension.width20,
                    right: Dimension.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimension.height15),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                          builder: (cartController) {
                            var _cartList = cartController.getItems;
                            return ListView.builder(
                              itemCount: _cartList.length,
                              // itemCount: cartController.getItems.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  height: Dimension.height20 * 5,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (() {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getPopularFood(
                                                    popularIndex, 'cartPage'));
                                          } else {
                                            var recommendedIndex = Get.find<
                                                    RecommendedProductController>()
                                                .recommendedProductList
                                                .indexOf(
                                                    _cartList[index].product!);

                                            Get.toNamed(
                                                RouteHelper.getRecommendedFood(
                                              recommendedIndex,
                                            ));
                                          }
                                        }),
                                        child: Container(
                                          width: Dimension.height20 * 5,
                                          height: Dimension.height20 * 5,
                                          margin: EdgeInsets.only(
                                              bottom: Dimension.height10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "${AppConstants.BASE_URL}/uploads/${cartController.getItems[index].img!}")),
                                            borderRadius: BorderRadius.circular(
                                                Dimension.radius20),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: Dimension.width10),
                                      Expanded(
                                        child: Container(
                                          height: Dimension.height20 * 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BigText(
                                                text: _cartList[index].name!,
                                                color: Colors.black54,
                                                size: 0,
                                              ),
                                              SmallText(text: "Spicy"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  BigText(
                                                    text:
                                                        "\$ ${_cartList[index].price!.toString()}",
                                                    color: Colors.redAccent,
                                                    size: 0,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(
                                                        Dimension.height10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        Dimension.radius20,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (() {
                                                            cartController.addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                -1);
                                                          }),
                                                          child: const Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor),
                                                        ),
                                                        SizedBox(
                                                          width: Dimension
                                                                  .width10 /
                                                              2,
                                                        ),
                                                        BigText(
                                                            text: cartController
                                                                .getItems[index]
                                                                .quantity
                                                                .toString()),
                                                        SizedBox(
                                                            width: Dimension
                                                                    .width10 /
                                                                2),
                                                        GestureDetector(
                                                            onTap: (() {
                                                              cartController
                                                                  .addItem(
                                                                _cartList[index]
                                                                    .product!,
                                                                1,
                                                              );
                                                            }),
                                                            child: const Icon(
                                                                Icons.add,
                                                                color: AppColors
                                                                    .signColor))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  )
                : const NoDataPage(text: 'Your Cart is Empty!!');
          })
        ],
      ),
      // bottomNavigationBar: GetBuilder<CartController>(
      //   builder: (cartController) {
      //     return Container(
      //       height: Dimension.bottomHeight,
      //       padding: EdgeInsets.only(
      //         top: Dimension.height10,
      //         bottom: Dimension.height10,
      //         left: Dimension.width20,
      //         right: Dimension.width20,
      //       ),
      //       decoration: BoxDecoration(
      //         color: AppColors.buttonBackgroundColor,
      //         borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(Dimension.radius20 * 2),
      //           topRight: Radius.circular(Dimension.radius20 * 2),
      //         ),
      //       ),
      //       child: cartController.getItems.length > 0
      //           ? Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Container(
      //                   padding: EdgeInsets.only(
      //                     top: Dimension.height10,
      //                     bottom: Dimension.height10,
      //                     left: Dimension.width20,
      //                     right: Dimension.width20,
      //                   ),
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(
      //                       Dimension.radius20,
      //                     ),
      //                     color: Colors.white,
      //                   ),
      //                   child: Row(
      //                     children: [
      //                       SizedBox(width: Dimension.width10 / 2),
      //                       BigText(
      //                           text: "\$ " +
      //                               cartController.totalAmount.toString()),
      //                       SizedBox(width: Dimension.width10 / 2),
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.only(
      //                     top: Dimension.height10,
      //                     bottom: Dimension.height10,
      //                     left: Dimension.width20,
      //                     right: Dimension.width20,
      //                   ),
      //                   decoration: BoxDecoration(
      //                     borderRadius:
      //                         BorderRadius.circular(Dimension.radius20),
      //                     color: AppColors.mainColor,
      //                   ),
      //                   child: const BigText(
      //                     text: "Total Amount",
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //               ],
      //             )
      //           : Container(),
      //     );
      //   },
      // ),
    );
  }
}
