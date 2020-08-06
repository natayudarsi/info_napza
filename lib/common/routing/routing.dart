import 'package:flutter/material.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/home.dart';
import 'package:info_napza/presentation/widget/slide_transition_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => _buildHomeScreen());
      
      case Routes.jenisNapzaScreen:
        return SlideRouteTransition(
         animationTo: AnimationTo.left,
         page: _buildJenisScreen()
        ) ;
    }
  }

  static Widget _buildHomeScreen() {
    return HomeScreen();
  }

  static Widget _buildJenisScreen() {
    return CategoryCard();
  }
}