import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/details_screen.dart';
import 'package:info_napza/home_page.dart';
import 'package:info_napza/main.dart';
import 'package:info_napza/presentation/screens/buku_napza/buku_napza_screen.dart';
import 'package:info_napza/presentation/screens/jenis_napza/detail_jenis_napza_screen.dart';
import 'package:info_napza/presentation/screens/jenis_napza/jenis_napza_screen.dart';
import 'package:info_napza/presentation/screens/quiz_screen/quiz_screen.dart';
import 'package:info_napza/presentation/screens/quiz_screen/start_quiz.dart';
import 'package:info_napza/presentation/screens/video_napza/video_list.dart';
import 'package:info_napza/presentation/screens/video_napza/video_napza_screen.dart';
import 'package:info_napza/presentation/widget/error_screen.dart';
import 'package:info_napza/presentation/widget/slide_transition_widget.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => _buildHomeScreen());
      
      // case Routes.jenisNapzaScreen:
      //   return SlideRouteTransition(
      //    animationTo: AnimationTo.left,
      //    page: _buildJenisScreen()
      //   ) ;
      // case Routes.kuisScreen:
      //   return SlideRouteTransition(
      //     animationTo: AnimationTo.left,
      //     page: _kuisScreen()
      //   );

      case Routes.bukuNapzaScreen:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _buildBukuNapzaScreen()
        );

      case Routes.jenisNapzaScreen:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _buildJenisNapzaScreen()
        );

      case Routes.kuisScreen:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _buildKuisScreen()
        );
      
      case Routes.detailJenisNapza:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _buildDetailJenisNapza(settings.arguments)
        );

      case Routes.videoList:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _buildVideoListScreen()
        );
      case Routes.kuisScreenStart:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _buildKuisScreenStart()
        );

      case Routes.videoScreen:
        return SlideRouteTransition(
          animationTo: AnimationTo.left,
          page: _buildVideoScreen()
        );
      default: 
      return MaterialPageRoute<dynamic>(builder: (_) => _buildErrorScreen());
    }
  }

  static Widget _buildHomeScreen() {
    return MyHomePageScreen();
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

  static Widget _buildJenisNapzaScreen() {
    return JenisNapzaScreen();
  }

  static Widget _buildKuisScreen() {
    return QuizScreen();
  }

  static Widget _buildDetailJenisNapza(dynamic arguments) {
    String napza = arguments['napza'];
    List efek = arguments['efek'];
    String name = arguments['name'];
    String picture = arguments['picture'];
    return DetailJenisNapzaScreen(
      efek: efek,
      napza: napza,
      name: name,
      picture: picture,
    );
  }

  static Widget _buildVideoScreen() {
    return VideoNapzaScreen();
  }

  static Widget _buildVideoListScreen() {
    return VideoNapzaListScreen();
  }

  static Widget _buildKuisScreenStart() {
    return QuizScreenStart();
  }
}