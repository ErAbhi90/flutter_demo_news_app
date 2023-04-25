import 'package:flutter/material.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_colors.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_strings.dart';
import 'package:flutter_demo_news_app/app_settings/router/app_router.dart';
import 'package:flutter_demo_news_app/modules/managers/data_manager.dart';
import 'package:flutter_demo_news_app/modules/managers/log_manager.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<LogManager>(LogManager());
  GetIt.I.registerSingleton<AppRouter>(AppRouter());
  GetIt.I.registerSingleton<DataManager>(DataManager());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _router = GetIt.I<AppRouter>().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}
