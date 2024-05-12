// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/models/response_model.dart';
import 'package:food_delivery_app/models/sign_up_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpbodyModel signUpbody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpbody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(
    String email,
    String password,
    String phone,
  ) async {
    Get.log("Go to Auth Controller page for login");
    _isLoading = true;
    update();
    Response response = await authRepo.login(email, password, phone);

    Get.log(
        "response from auth_controller login method ${response.toString()}");

    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      Get.log("Backend Token");
      authRepo.saveUserToken(response.body["token"]);
      Get.log("My token is   ${response.body["token"]}");

      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  // for log out
  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
