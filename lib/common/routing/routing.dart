import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/details_screen.dart';
import 'package:info_napza/home_page.dart';
import 'package:info_napza/main.dart';
import 'package:info_napza/presentation/screens/buku_napza/buku_napza_screen.dart';
import 'package:info_napza/presentation/widget/error_screen.dart';
import 'package:info_napza/presentation/widget/slide_transition_widget.dart';

import 'routes.dart';

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
      case Routes.kuisScreen:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _kuisScreen()
        );

      case Routes.bukuNapzaScreen:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _buildBukuNapzaScreen()
        );
      default: 
      return MaterialPageRoute<dynamic>(builder: (_) => _buildErrorScreen());
    }
  }

  static Widget _buildHomeScreen() {
    return MyHomePageScreen();
  }

  static Widget _buildJenisScreen() {
    return CategoryCard();
  }
  
  static Widget _kuisScreen() {
    return DetailsScreen();
  }
    static Widget _buildErrorScreen() {
      return ErrorScreen();
  }

  static Widget _buildBukuNapzaScreen() {
    return BukuNapzaScreen();
  }
}