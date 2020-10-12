import 'package:get/get.dart';
import 'package:learning/controllers/login_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
