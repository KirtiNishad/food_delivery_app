import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/user_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widget/account_widget.dart';
import 'package:food_delivery_app/widget/app_icon.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      Get.log("User has logged in");
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Center(
          child: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimension.height20),
                      child: Column(
                        children: [
                          //profile icon
                          AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimension.height30 + Dimension.height45,
                            size: Dimension.height15 * 10,
                          ),

                          SizedBox(height: Dimension.height30),

                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  //name
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 5 / 2,
                                      size: Dimension.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel!.name,
                                    ),
                                  ),

                                  SizedBox(height: Dimension.height20),

                                  //phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 5 / 2,
                                      size: Dimension.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel!.phone,
                                    ),
                                  ),

                                  SizedBox(height: Dimension.height20),

                                  //email
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 5 / 2,
                                      size: Dimension.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel!.email,
                                    ),
                                  ),
                                  SizedBox(height: Dimension.height20),

                                  //address
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 5 / 2,
                                      size: Dimension.height10 * 5,
                                    ),
                                    bigText: const BigText(
                                      text: "Fill your address",
                                    ),
                                  ),

                                  SizedBox(height: Dimension.height20),

                                  //messages
                                  /* AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.message_outlined,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimension.height10 * 5 / 2,
                                        size: Dimension.height10 * 5,
                                      ),
                                      bigText: BigText(text: "Message"),
                                    ), */
                                  /*  SizedBox(
                                      height: Dimension.height20,
                                    ), */
                                  //log out

                                  GestureDetector(
                                    onTap: (() {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.offNamed(
                                          RouteHelper.getSignInPage(),
                                        );
                                      }
                                    }),
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimension.height10 * 5 / 2,
                                        size: Dimension.height10 * 5,
                                      ),
                                      bigText: const BigText(text: "Logout"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const CustomLoader())
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimension.height10 * 18,
                          margin: EdgeInsets.only(
                              left: Dimension.width20,
                              right: Dimension.width20),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/signintocontinue.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Get.toNamed(RouteHelper.getSignInPage());
                          }),
                          child: Container(
                            width: double.maxFinite,
                            height: Dimension.height20 * 5,
                            margin: EdgeInsets.only(
                                left: Dimension.width20,
                                right: Dimension.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimension.radius20),
                            ),
                            child: Center(
                              child: BigText(
                                text: "Sign In",
                                color: Colors.white,
                                size: Dimension.font26,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
