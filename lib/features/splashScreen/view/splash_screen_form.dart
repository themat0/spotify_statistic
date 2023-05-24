import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_statistic/styles/colors.dart';

class SplashScreenForm extends StatelessWidget {
  const SplashScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: SpotifyColors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Center(
        child: Image.asset(
          'assets/images/logo-no-background.png',
          scale: 5,
        ),
      ),
    );
  }
}
