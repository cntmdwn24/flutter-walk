import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:walk/presentation/screens/splash_screen.dart';

final supportedLocales = [Locale('en', 'US'), Locale('ko', 'KR')];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Future.delayed(Duration(seconds: 1), () {
    runApp(
      EasyLocalization(
          supportedLocales: supportedLocales,
          path: 'assets/translations',
          fallbackLocale: Locale('en', 'US'),
          child: MyApp()),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplashScreen());
  }
}
