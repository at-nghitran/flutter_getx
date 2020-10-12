import 'package:get/get.dart';
import 'package:learning/controllers/binding/home_binding.dart';
import 'package:learning/routers/router_name.dart';
import 'package:learning/views/pages/home.dart';
import 'package:learning/views/pages/login.dart';
import 'package:learning/views/pages/profile.dart';

List<GetPage> routers = [
  GetPage(
    name: RoutersName.login,
    page: () => LoginPage(),
  ),
  GetPage(
    name: RoutersName.home,
    page: () => HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: RoutersName.profile,
    page: () => ProfilePage(),
  )
];
