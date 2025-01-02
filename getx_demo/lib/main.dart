import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/app/routes/app_pages.dart';
import 'package:getx_demo/app/services/cart_service.dart';

void main() async{
  await GetStorage.init();
  Get.put(CartService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.PRODUCT,
      getPages: AppPages.routes,
    );
  }
}
