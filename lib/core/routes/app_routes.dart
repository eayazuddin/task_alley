import 'package:get/get.dart';
import 'package:task_alley/view/screens/base/screen/base.dart';
import '../../view/customer/home/screens/home/home_screen.dart';
import '../../view/customer/onboarding/screen/onboarding.dart';
import '../../view/provider/auth/verify_bvn/screen/verify_bvn.dart';
import '../../view/provider/home/screens/home/home_screen.dart';
import '../../view/provider/identity_verification/screen/identity_verification.dart';
import '../../view/provider/onboarding/screen/onboarding.dart';
import '../../view/screens/auth/address/screen/address_screen.dart';
import '../../view/screens/auth/login/screen/login_page.dart';
import '../../view/screens/auth/otp/screen/otp_screen.dart';
import '../../view/screens/auth/referral/screen/referral_screen.dart';
import '../../view/screens/auth/set_new_pass/screen/set_new_password.dart';
import '../../view/screens/auth/sign_up/screen/signup_page.dart';
import '../../view/screens/auth/verify_phone/screen/verify_phone_screen.dart';
import '../../view/screens/role/screen/role.dart';
import '../../view/screens/splash_screen/screen/splash_screen.dart';

///=========================App Routes=========================

class AppRoutes {
  static const String splashScreen = "/SplashScreen";
  static const String loginPage = "/LoginPage";
  static const String signupScreen = "/SignupScreen";
  static const String addressScreen = "/AddressScreen";
  static const String referralScreen = "/ReferralScreen";
  static const String verifyPhoneScreen = "/VerifyPhoneScreen";
  static const String otpScreen = "/OtpScreen";
  static const String setPasswordScreen = "/SetPasswordScreen";
  static const String identityVerification = "/IdentityVerification";
  static const String verifyBvnScreen = "/VerifyBvnScreen";

  static const String cusOnboardingScreen = "/CusOnboardingScreen";
  static const String proOnboardingScreen = "/ProOnboardingScreen";

  static const String roleScreen = "/RoleScreen";

  static const String customerHomeScreen = "/CustomerHomeScreen";
  static const String providerHomeScreen = "/ProviderHomeScreen";

  static const String base = "/Base";


  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: customerHomeScreen,
      page: () => CustomerHomeScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: providerHomeScreen,
      page: () => ProviderHomeScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: roleScreen,
      page: () => RoleScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: addressScreen,
      page: () => AddressScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: referralScreen,
      page: () => ReferralScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: verifyPhoneScreen,
      page: () => VerifyPhoneScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: otpScreen,
      page: () => OtpScreen(),



      // {
      //   // final args = Get.arguments ?? {};
      //   // final email = args['email'] ?? '';
      //   // return OtpScreen();
      // },


      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    // GetPage(
    //   name: otpScreen,
    //   page: () => OtpScreen(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: Duration(milliseconds: 400),
    // ),
    GetPage(
      name: setPasswordScreen,
      page: () => SetPasswordScreen(email: '', otp: ''),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: cusOnboardingScreen,
      page: () => CusOnboardingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: proOnboardingScreen,
      page: () => ProOnboardingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: identityVerification,
      page: () => IdentityVerification(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: verifyBvnScreen,
      page: () => VerifyBvnScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: base,
      page: () => Base(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 400),
    ),
  ];
}
