import 'package:flutter/material.dart';

class SnackBarUtils {
  void showErrorSnackBar(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(
      content: Text(
        errorMessage,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSuccessSnackBar(BuildContext context, String successMessage) {
    final snackBar = SnackBar(
      content: Text(
        successMessage,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
