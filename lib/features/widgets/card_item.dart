import 'package:flutter/material.dart';
import 'package:spotify_statistic/styles/dimensions.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.index, required this.image, required this.name});

  final int index;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(Dimensions.spanSmallPlus),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.circular), // Image border
          child: Stack(
            children: [
              Opacity(
                  opacity: 0.8,
                  child: SizedBox.fromSize(
                      child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ))),
              Positioned(
                bottom: 2,
                width: MediaQuery.of(context).size.width / 2 - 16,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Text(
                  "#$index",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          ),
        ),
      );
}
