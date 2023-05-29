import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_statistic/styles/colors.dart';
import 'package:spotify_statistic/styles/images.dart';

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
          SpotifyImages.logo,
          scale: 5,
        ),
      ),
    );
  }
}
