import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/controllers/cart_controller.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.lazyPut<CartController>(() => CartController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
