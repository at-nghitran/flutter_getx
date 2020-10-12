import 'package:get/get.dart';
import 'package:learning/controllers/login_controller.dart';

class HomeController extends GetxController {
  final LoginController _controller = Get.find();
  final emailLength = 0.obs;

  @override
  void onInit() {
    getLength();
    super.onInit();
  }

  getLength() {
    emailLength.value = _controller.loginInfo.value?.email?.length;
  }
}
