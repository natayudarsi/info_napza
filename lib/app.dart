import 'package:flutter/material.dart';
import 'package:info_napza/common/routing/routing.dart';

import 'common/routing/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: ScreenGame(),
    );
  }
}