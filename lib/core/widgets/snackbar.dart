import 'package:flutter/material.dart';
import 'package:spotify_statistic/styles/colors.dart';

class SnackBarUtils {
  void showErrorSnackBar(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(
      content: Text(
        errorMessage,
        textAlign: TextAlign.center,
      ),
      backgroundColor: SpotifyColors.red,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
