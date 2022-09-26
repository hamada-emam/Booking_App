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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/hotel.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Positioned(
        top: 10,
        left: 20,
        child: Text(
          "london",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ]);
  }
}
