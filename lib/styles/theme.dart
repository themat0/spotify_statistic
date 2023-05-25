import 'package:flutter/material.dart';
import 'package:spotify_statistic/styles/colors.dart';
import 'package:spotify_statistic/styles/dimensions.dart';

ThemeData createTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: SpotifyColors.backgroundColor,
      primaryColor: SpotifyColors.primaryColor,
      brightness: Brightness.dark,
      textTheme: _createTextTheme(context),
    );

TextTheme _createTextTheme(BuildContext context) => Theme.of(context).textTheme.copyWith(
      displayLarge: const TextStyle(
        fontSize: Dimensions.fontSizeBig,
        color: SpotifyColors.white,
      ),
      displayMedium: const TextStyle(
        fontSize: Dimensions.fontSizeMedium,
        color: SpotifyColors.white,
      ),
      displaySmall: const TextStyle(
        fontSize: Dimensions.fontSizeSmallPlus,
        color: SpotifyColors.white,
      ),
      titleLarge: const TextStyle(
        fontSize: Dimensions.fontSizeBig,
        color: SpotifyColors.white,
      ),
      labelLarge: const TextStyle(
        fontSize: Dimensions.fontSizeSmall,
        fontWeight: FontWeight.w200,
        color: SpotifyColors.white,
      ),
    );
