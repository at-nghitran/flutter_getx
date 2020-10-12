import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning/controllers/binding/app_binding.dart';
import 'package:learning/routers/app_router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routers,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      initialBinding: AppBinding(),
    );
  }
}
