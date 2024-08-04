import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/moduels/layouts/layout_screen.dart';
import 'package:islami/moduels/layouts/screens/azkarSabah.dart';
import 'package:islami/moduels/layouts/screens/azkar_masaa.dart';
import 'package:islami/moduels/layouts/screens/hadeth_details.dart';
import 'package:islami/moduels/layouts/screens/nabi_screen.dart';
import 'package:islami/moduels/layouts/screens/sura_details.dart';
import 'package:islami/moduels/splash/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LayoutScreen.routeName: (context) => LayoutScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
        NabiScreen.routeName: (context) => NabiScreen(),
        AzkarSabah.routeName: (context) => AzkarSabah(),
        AzkarMasaa.routeName: (context) => AzkarMasaa(),
      },
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
    );
  }
}
