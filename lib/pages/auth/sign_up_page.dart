import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/base/show_custom_snackbar.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/models/sign_up_body_model.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimension.dart';
import 'package:food_delivery_app/widget/app_text_field.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackbar("Please enter your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackbar("Please enter your phone number",
            title: "phone Number");
      } else if (email.isEmpty) {
        showCustomSnackbar("Please enter your email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackbar("Please enter valid email address", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackbar("Please enter Password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackbar("Password can\'t be less than 6 charactes",
            title: "Password");
      } else {
        SignUpbodyModel signUpBody = SignUpbodyModel(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );

        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            Get.log("Successfully Registered");
            Get.toNamed(RouteHelper.initial);
          } else {
            showCustomSnackbar(status.message);
          }
        });
        Get.log(signUpBody.toString());
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (authController) {
            return !authController.isLoading
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: Dimension.screenHeight * 0.05),

                        Container(
                          height: Dimension.screenHeight * 0.25,
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: Dimension.radius20 * 4,
                              backgroundImage:
                                  const AssetImage("assets/images/logo 2.png"),
                            ),
                          ),
                        ),
                        AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email,
                        ),
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        AppTextField(
                          textController: passwordController,
                          hintText: "Password",
                          icon: Icons.password_sharp,
                          isObscure: true,
                        ),
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        AppTextField(
                            textController: nameController,
                            hintText: "Name",
                            icon: Icons.person),
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        AppTextField(
                          textController: phoneController,
                          hintText: "Phone",
                          icon: Icons.phone,
                        ),
                        SizedBox(
                          height: Dimension.height20,
                        ),

                        //sign up button
                        GestureDetector(
                          onTap: (() {
                            _registration(authController);
                          }),
                          child: Container(
                            width: Dimension.screenWidth / 2,
                            height: Dimension.screenHeight / 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Dimension.radius30,
                              ),
                              color: AppColors.mainColor,
                            ),
                            child: Center(
                              child: BigText(
                                text: "Sign Up",
                                size: Dimension.font20 + Dimension.font20 / 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Dimension.height10,
                        ),

                        RichText(
                          text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: "Have an account already?",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimension.font20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.screenHeight * 0.05,
                        ),

                        //sign up options
                        RichText(
                          text: TextSpan(
                            text: "Sign up using one of the following methods",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimension.font16,
                            ),
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: Dimension.radius30,
                                backgroundImage: AssetImage(
                                    "assets/images/${signUpImages[index]}"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : const CustomLoader();
          },
        ));
  }
}
