import 'package:flutter/material.dart';
import 'package:spotify_statistic/styles/colors.dart';

class BlockUiProgressIndicator extends StatelessWidget {
  const BlockUiProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: SpotifyColors.primaryColor),
    );
  }
}
