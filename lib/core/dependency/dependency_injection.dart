
import 'package:get/get.dart';
import 'package:task_alley/view/screens/auth/controller/auth_controller.dart';

import '../../view/screens/post_task/controller/post_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================Default Custom Controller ==================


    Get.lazyPut(() => PostController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);


  }
}
