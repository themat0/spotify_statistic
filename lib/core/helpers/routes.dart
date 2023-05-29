import 'package:flutter/material.dart';
import 'package:spotify_statistic/features/homeView/view/home_route.dart';
import 'package:spotify_statistic/features/loginScreen/view/login_screen_route.dart';
import 'package:spotify_statistic/features/splashScreen/view/splash_screen_route.dart';

final routes = <String, WidgetBuilder>{
  SplashScreenRoute.ROUTE_NAME: (_) => const SplashScreenRoute(),
};

Widget getGenerateRoutePage(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute.ROUTE_NAME:
      return const SplashScreenRoute();
    case LoginScreenRoute.ROUTE_NAME:
      return const LoginScreenRoute();
    case HomeRoute.ROUTE_NAME:
      return const HomeRoute();
    default:
      throw Exception("Not screen specified to route ${settings.name}");
  }
}
