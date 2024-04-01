import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:park_and_fly/ui/themes/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:park_and_fly/providers/application_settings_provider.dart';
import 'utils/router_config.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    // final theme = ref.watch(themeProvider);
    // final locale = ref.watch(localeProvider);
    final applicationSettings = ref.watch(applicationSettingsProvider);

    return MaterialApp.router(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ru'), // Russian
        Locale('en'), // English
        Locale('bg'), // Bulgarian
      ],
      locale: applicationSettings.currentLocale,
      title: "Park & Fly",
      theme: applicationSettings.isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      routerConfig: goRouter,
    );
  }
}
