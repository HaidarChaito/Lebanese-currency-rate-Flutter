import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lirarate/view/home_screen.dart';
import 'package:lirarate/shared/routes.dart';
import 'package:lirarate/util/home_binding.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      initialRoute: Routes.home,
      getPages: [
        GetPage(
            name: Routes.home,
            page: () => HomeScreen(),
            binding: HomeBinding()),
      ],
    );
  }
}
