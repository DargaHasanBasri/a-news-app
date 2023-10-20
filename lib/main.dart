import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/services/service_locator.dart';
import 'package:a_news_app/theme_preferences.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:a_news_app/utils/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'services/navigation_service.dart';

Future<void> main() async {
  runApp(
    ChangeNotifierProvider<ThemePreferences>(
      create: (_) => ThemePreferences()..initialize(),
      child: const MyApp(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseStatefulState<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemePreferences>(
      builder: (context, provider, child) {
        return MaterialApp(
          locale: currentLocale,
          title: 'aNewsApp',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData.light().copyWith(
            primaryColor: CustomColors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: CustomColors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          themeMode: provider.themeMode,
          navigatorKey: locator<NavigationService>().baseNavigatorKey,
          onGenerateRoute: RouteHelper.generateRoute,
          initialRoute: RouteHelper.bottomNavigation,
        );
      },
    );
  }
}
