import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:mifinity_task/Screens/SignInScreen/sign_in_screen.dart';
import 'package:mifinity_task/Router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),

      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.black38),
      //   useMaterial3: true,
      // ),
      // home: const SignInScreen(),
    );
  }
}