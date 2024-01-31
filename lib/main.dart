import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easy_localization/lang/codegen_loader.g.dart';

import 'my_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
          Locale('ne'),
          Locale('sv')
        ],
        path: 'assets/lang',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const MyHomePage());
  }
}
