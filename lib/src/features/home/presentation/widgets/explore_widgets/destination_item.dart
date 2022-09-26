import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class DestinationItem extends StatelessWidget {
  const DestinationItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 180,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/italy.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 10,
        left: 20,
        child: Text(
          "Italy",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
}
