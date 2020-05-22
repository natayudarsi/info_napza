import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:info_napza/bottom_navbar.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/details_screen.dart';
import 'package:info_napza/home.dart';
import 'package:info_napza/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Info Napza App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: Color(0xFFF8F8F8),
        textTheme: Theme.of(context).textTheme.apply(displayColor: Color(0xFF222B45))
      ),
      home: HomeScreen(),
    );
  }
}


