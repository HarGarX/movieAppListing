import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movielistapp/core/services/movie_service.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await _init().then((_) {
    runApp(
      GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
      ),
    );
  });
}

// TODO: Implment Device Orintaion widht & Height Changes
Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => MovieService().init())
      .then((value) => print("Movie SERVICE INITIALIZED"));
}
