import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_statistic/core/widgets/koin_page.dart';
import 'package:spotify_statistic/features/homeView/view/home_route.dart';
import 'package:spotify_statistic/features/loginScreen/view/login_screen_route.dart';
import 'package:spotify_statistic/features/splashScreen/cubit/splash_screen_cubit.dart';
import 'package:spotify_statistic/features/splashScreen/view/splash_screen_form.dart';

class SplashScreenRoute extends KoinPage<SplashScreenCubit> {
  const SplashScreenRoute({super.key});

  static const ROUTE_NAME = 'SplashScreenRoute';

  @override
  void initBloc(bloc) => bloc.init();

  void onLoginResult(BuildContext context, SplashScreenState state) {
    switch (state) {
      case SplashScreenState.loggedIn:
        Navigator.of(context).pushReplacementNamed(HomeRoute.ROUTE_NAME);
        break;
      case SplashScreenState.notLogged:
        Navigator.of(context).pushReplacementNamed(LoginScreenRoute.ROUTE_NAME);
        break;
      default:
        return;
    }
  }

  @override
  Widget buildPage(BuildContext context) => BlocListener<SplashScreenCubit, SplashScreenState>(
        listener: onLoginResult,
        child: const SplashScreenForm(),
      );
}
