import 'package:flutter/material.dart';

class SecondButtonWidget extends StatelessWidget {
  const SecondButtonWidget(
      {required this.text,
      this.isActive = false,
      required this.onPressed,
      Key? key})
      : super(key: key);

  final String text;
  final bool isActive;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: !isActive ? onPressed : null,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(50, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              text,
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Container(
            height: 3,
            width: 25,
            color: isActive ? Colors.white : null,
          ),
        ],
      ),
    );
  }
}
