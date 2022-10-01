import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/features/explore/data/models/popular_destination_model.dart';
import 'package:flutter/material.dart';

class DestinationItem extends StatelessWidget {
  final PopularDestination popularDestination;
  const DestinationItem({
    Key? key, required this.popularDestination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage(
              popularDestination.imagePath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 10,
        left: 20,
        child: Text(
          popularDestination.countryName,
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
