import 'package:flutter/material.dart';

class BlockUiProgressIndicator extends StatelessWidget {
  const BlockUiProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black.withAlpha(100),
      child: const CircularProgressIndicator(color: Colors.green),
    );
  }
}
