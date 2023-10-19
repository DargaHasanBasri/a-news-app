import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/services/service_locator.dart';
import 'package:a_news_app/theme_preferences.dart';
import 'package:a_news_app/utils/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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
          title: 'aNewsApp',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData.dark().copyWith(
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
