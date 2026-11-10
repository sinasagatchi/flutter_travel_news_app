import 'dart:io';
import 'dart:ui';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_travel_news_app/config/app_router.dart';
import 'package:flutter_travel_news_app/config/app_locale.dart';
import 'package:flutter_travel_news_app/config/app_state.dart';
import 'package:flutter_travel_news_app/config/app_theme.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        tools: [
          ...DevicePreview.defaultTools,
          DevicePreviewScreenshot(
            onScreenshot: screenshotAsFiles(Directory('/home/saul/Pictures/')),
          ),
        ],
        builder: (context) => const MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppLocaleController _localeController = AppLocaleController();
  final AppStateController _appStateController = AppStateController();

  @override
  void dispose() {
    _localeController.dispose();
    _appStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      controller: _appStateController,
      child: AppLocaleScope(
        controller: _localeController,
        child: AnimatedBuilder(
          animation: _localeController,
          builder: (context, _) => MaterialApp.router(
            locale: _localeController.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: AppRouter.appRouter,
            scrollBehavior: const MaterialScrollBehavior()
                .copyWith(dragDevices: {PointerDeviceKind.mouse}),
          ),
        ),
      ),
    );
  }
}
