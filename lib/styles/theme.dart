import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

ThemeData createTheme(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: SpotifyColors.backgroundColor,
      primaryColor: SpotifyColors.primaryColor,
      brightness: Brightness.dark,
      textTheme: _createTextTheme(context),
    );
TextTheme _createTextTheme(BuildContext context) => Theme.of(context).textTheme.copyWith(
      displayLarge: const TextStyle(
        fontSize: Dimens.fontSizeBig,
        color: SpotifyColors.white,
      ),
      displayMedium: const TextStyle(
        fontSize: Dimens.fontSizeMedium,
        color: SpotifyColors.white,
      ),
      displaySmall: const TextStyle(
        fontSize: Dimens.fontSizeSmallPlus,
        color: SpotifyColors.white,
      ),
      titleLarge: const TextStyle(
        fontSize: Dimens.fontSizeBig,
        color: SpotifyColors.white,
      ),
      labelLarge: const TextStyle(
        fontSize: Dimens.fontSizeSmall,
        fontWeight: FontWeight.w200,
        color: SpotifyColors.white,
      ),
);