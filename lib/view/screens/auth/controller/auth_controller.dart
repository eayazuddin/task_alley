import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_alley/service/api_url.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../helper/shared_prefe/shared_prefe.dart';
import '../../../../service/api_check.dart';
import '../../../../service/api_service.dart';
import '../../../../utils/ToastMsg/toast_message.dart';
import '../../../../utils/app_const/app_const.dart';

class AuthController extends GetxController {

  //============================= Sign Up =======================

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> roleController = TextEditingController().obs;

  RxBool signUpLoading = false.obs;

  Future<void> signUp(role) async {
    signUpLoading(true);

    var body = {
      "name": nameController.value.text,
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "confirmPassword": confirmPasswordController.value.text,
      "phone": phoneController.value.text,
      "role": role,
    };

    var response = await ApiClient.postData(ApiUrl.signUp, jsonEncode(body));

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar(response.body['message'], isError: false);
      signUpLoading(false);
      // Get.offAllNamed(AppRoutes.otpScreen);
      Get.offAllNamed(
        AppRoutes.otpScreen,
        arguments: {"email": emailController.value.text.trim()},
      );
    } else {
      ApiChecker.checkApi(response);
      signUpLoading(false);
    }
  }

  clearSignUpData() {
    nameController.value.clear();
    emailController.value.clear();
    passwordController.value.clear();
    confirmPasswordController.value.clear();
  }

  //===================================  Address Update  =======================================//

  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  RxBool addressUpdateLoading = false.obs;

  final Rx<File?> documentPath = Rx<File?>(null);

  Future<void> pickDocument() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      documentPath.value = File(result.files.single.path!);
    }
  }

  Future<void> updateMyProfile() async {
    addressUpdateLoading(true);
    var body = {
      "data": jsonEncode({
        "name": 'vbdfg',
        "city": cityController.value.text,
        "address": addressController.value.text,
      }),
    };

    final response = await ApiClient.patchMultipartData(
      ApiUrl.address,
      body,
      multipartBody: [MultipartBody("address_document", documentPath.value!)],
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar('Profile Updated Successfully', isError: false);
      addressUpdateLoading(false);

      Get.offAllNamed(AppRoutes.referralScreen);

      nameController.value.clear();
      cityController.value.clear();
      addressController.value.text;

      Get.back();
    } else {
      ApiChecker.checkApi(response);
      addressUpdateLoading(false);
    }
  }

  //========================================== Sign up varification ================================

  // Rx<TextEditingController> signUpOtpController = TextEditingController().obs;
  //
  // RxBool signUpOtpLoading = false.obs;
  //
  // Future<void> signUpVarification({required String email}) async {
  //   signUpOtpLoading(true);
  //
  //   num otp = num.parse(signUpOtpController.value.text);
  //
  //   var body = {"email": email, "verifyCode": otp};
  //
  //   var response = await ApiClient.postData(
  //     ApiUrl.signUpVarification,
  //     jsonEncode(body),
  //   );
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     showCustomSnackBar(response.body['message'], isError: false);
  //     signUpOtpLoading(false);
  //     clearSignUpData();
  //     // Get.offAllNamed(AppRoutes.signinScreen);
  //   } else {
  //     ApiChecker.checkApi(response);
  //     signUpOtpLoading(false);
  //   }
  // }
  //========================== Resend Otp in sign up ===============================

  // RxInt resendOtpCount = 59.obs;
  //
  // void startTimer() {
  //   resendOtpCount.value = 59;
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (resendOtpCount.value > 0) {
  //       resendOtpCount.value--;
  //     } else {
  //       timer.cancel();
  //     }
  //   });
  // }

  //========================================== SignUpOtp ==============================


  //================================== SignUpOtp  ======================================//

  Rx<TextEditingController> otpController = TextEditingController().obs;

  Future<void> signUpOtp({required String email, required String otp}) async {
    var response = await ApiClient.postData(
      ApiUrl.varifyCode,
      jsonEncode({
        "email": email,
        "verifyCode": int.tryParse(otp), //  Convert to number
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar(response.body['message'], isError: false);

      SharePrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['data']['accessToken'],
      );

      Get.offAllNamed(AppRoutes.addressScreen);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Future<void> signUpResendOtp({required String email}) async {
  //   var response = await ApiClient.postData(
  //     ApiUrl.resendVerifyCode,
  //     jsonEncode({"email": email}),
  //   );
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     startTimer();
  //     showCustomSnackBar(response.body['message'], isError: false);
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }
  // }

  //========================================== Login ==========================================//

  final loginEmailController = TextEditingController(
    text: kDebugMode ? 'eayazuddin@gmail.com' : '',
  );

  final loginPasswordController = TextEditingController(
    text: kDebugMode ? '123456' : '',
  );

  final RxBool loginLoading = false.obs;

  Future<void> login() async {
    loginLoading(true);

    final body = {
      "email": loginEmailController.text.trim(),
      "password": loginPasswordController.text.trim(),
    };

    try {
      final response = await ApiClient.postData(ApiUrl.login, jsonEncode(body));

      if (response.statusCode == 200 || response.statusCode == 201) {

        SharePrefsHelper.setString(
          AppConstants.bearerToken,
          response.body["data"]["accessToken"],
        );

        final token = await SharePrefsHelper.getString(
          AppConstants.bearerToken,
        );
        debugPrint('Token: $token');

        Get.offAllNamed(AppRoutes.base);
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong: $e", isError: true);
    } finally {
      loginLoading(false);
    }
  }

  // Rx<TextEditingController> loginEmailController = TextEditingController(
  //       text: kDebugMode ? 'nofif65355@hadvar.com' : '',).obs;
  // Rx<TextEditingController> loginPasswordController =
  //     TextEditingController(text: kDebugMode ? '12345678' : '').obs;
  //
  // RxBool loginLoading = false.obs;
  //
  // Future<void> login() async {
  //
  //   loginLoading(true);
  //   var body = {
  //     "email": loginEmailController.value.text,
  //     "password": loginPasswordController.value.text,
  //   };
  //
  //   var response = await ApiClient.postData(ApiUrl.login, jsonEncode(body));
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     showCustomSnackBar(response.body['message'], isError: false);
  //     loginLoading(false);
  //     SharePrefsHelper.setString(
  //       AppConstants.bearerToken,
  //       response.body['data']['accessToken'],
  //     );
  //
  //     final token = await SharePrefsHelper.getString(AppConstants.bearerToken);
  //     debugPrint('token =============>> : $token');
  //
  //     Get.offAllNamed(AppRoutes.customerHomeScreen);
  //   } else {
  //     ApiChecker.checkApi(response);
  //     loginLoading(false);
  //   }
  // }

  // class LoginController extends GetxController  {
  // // Controllers
  // final emailController = TextEditingController(
  // text: kDebugMode ? 'nofif65355@hadvar.com' : '',
  // );
  //
  // final passwordController = TextEditingController(
  // text: kDebugMode ? '12345678' : '',
  // );
  //
  // // Observables
  // final RxBool isLoading = false.obs;
  //
  // // API Base URL
  //  String baseUrl = "http://10.10.20.9:9000/api/v1";
  // // http://10.10.20.9:9000/
  // // http://10.10.20.9:9000/api/v1/auth/login
  // // /auth/login
  // // Login Function
  // Future<void> login() async {
  // isLoading(true);
  //
  // final body = {
  // "email": emailController.text.trim(),
  // "password": passwordController.text.trim(),
  // };
  //
  // try {
  // final response = await ApiClient.postData("$baseUrl/auth/login", jsonEncode(body));
  //
  // if (response.statusCode == 200 || response.statusCode == 201) {
  // final loginModel = LoginModel.fromJson(response.body);
  //
  // showCustomSnackBar(loginModel.message, isError: false);
  //
  // await SharePrefsHelper.setString(
  // AppConstants.bearerToken,
  // loginModel.data.accessToken,
  // );
  //
  // final token = await SharePrefsHelper.getString(AppConstants.bearerToken);
  // debugPrint('Token: $token');
  //
  // Get.offAllNamed(AppRoutes.customerHomeScreen);
  // } else {
  // ApiChecker.checkApi(response);
  // }
  // } catch (e) {
  // showCustomSnackBar("Something went wrong: $e", isError: true);
  // } finally {
  // isLoading(false);
  // }
  // }
  //
  // @override
  // void onClose() {
  // emailController.dispose();
  // passwordController.dispose();
  // super.onClose();
  // }
  // }

  //================================================= Forget Password ================================

  // Rx<TextEditingController> forgetPasswordEmailController =
  //     TextEditingController().obs;
  //
  // RxBool forgetPasswordLoading = false.obs;

  // Future<void> forgotPassword() async {
  //   forgetPasswordLoading(true);
  //   var response = await ApiClient.postData(
  //     ApiUrl.forgotPassword,
  //     jsonEncode({"email": forgetPasswordEmailController.value.text}),
  //   );
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     showCustomSnackBar(response.body['message'], isError: false);
  //     forgetPasswordLoading(false);
  //     // Get.toNamed(
  //     //   AppRoutes.otpScreen,
  //     //   arguments: forgetPasswordEmailController.value.text,
  //     // );
  //   } else {
  //     ApiChecker.checkApi(response);
  //     forgetPasswordLoading(false);
  //   }
  // }

  //========================================== Forgot varification ================================

  // Rx<TextEditingController> forgotOtpController = TextEditingController().obs;
  //
  // RxBool forgotOtpLoading = false.obs;
  //
  // Future<void> forgotVarification({required String email}) async {
  //   forgotOtpLoading(true);
  //
  //   num otp = num.parse(forgotOtpController.value.text);
  //
  //   var body = {"email": email, "resetCode": otp};
  //
  //   var response = await ApiClient.postData(
  //     ApiUrl.verifyResetOtp,
  //     jsonEncode(body),
  //   );
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     showCustomSnackBar(response.body['message'], isError: false);
  //     forgotOtpLoading(false);
  //     // Get.toNamed(AppRoutes.setPasswordScreen, arguments: email);
  //   } else {
  //     ApiChecker.checkApi(response);
  //     forgotOtpLoading(false);
  //   }
  // }
  //========================== Resend Otp in forgot ===============================

  RxInt forgotResendOtpCount = 59.obs;

  void forgotStartTimer() {
    forgotResendOtpCount.value = 59;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (forgotResendOtpCount.value > 0) {
        forgotResendOtpCount.value--;
        forgotResendOtpCount.refresh();
      } else {
        timer.cancel();
      }
    });
  }

  // Future<void> forgotResendOtp({required String email}) async {
  //   var response = await ApiClient.postData(
  //     ApiUrl.resendResetCode,
  //     jsonEncode({"email": email}),
  //   );
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     forgotStartTimer();
  //     showCustomSnackBar(response.body['message'], isError: false);
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }
  // }

  //=========================== Forgot reset Password =================

  Rx<TextEditingController> resetPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController> resetConfirmPasswordController =
      TextEditingController().obs;

  // RxBool resetPasswordLoading = false.obs;
  //
  // Future<void> resetPassword({required String email}) async {
  //   resetPasswordLoading(true);
  //
  //   var body = {
  //     "email": email,
  //     "password": resetPasswordController.value.text,
  //     "confirmPassword": resetConfirmPasswordController.value.text,
  //   };
  //
  //   var response = await ApiClient.postData(
  //     ApiUrl.resetPassword,
  //     jsonEncode(body),
  //   );
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     showCustomSnackBar(response.body['message'], isError: false);
  //     resetPasswordLoading(false);
  //     // Get.offAllNamed(AppRoutes.signinScreen);
  //   } else {
  //     ApiChecker.checkApi(response);
  //     resetPasswordLoading(false);
  //   }
  // }
}
