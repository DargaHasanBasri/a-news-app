import 'package:a_news_app/services/service_locator.dart';
import 'package:a_news_app/utils/route_helper.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aNewsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteHelper.generateRoute,
      initialRoute: RouteHelper.home,
    );
  }
}
