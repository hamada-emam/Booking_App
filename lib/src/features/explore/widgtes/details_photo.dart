import 'package:booking_app/src/features/explore_hotels/data/models/hotel_image.dart';
import 'package:flutter/material.dart';

import '../../../app/core/utils/colors_manager.dart';

class DetailsPhoto extends StatelessWidget {
  final List<HotelImage> photos;

  const DetailsPhoto({Key? key, required this.photos}) : super(key: key);

  Widget buildDivider(double endIndent) {
    return Container(
      width: endIndent,
      height: 3.5,
      color: Colors.blue.shade800,
    );
  }

  final List<String> rates = const ["Room", "Services", "Location", "Price"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: photos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.network(
            'http://api.mahmoudtaha.com/images/${photos[index].image}',
            fit: BoxFit.fill,
            height: 150,
          ),
        ),
      ),
    );
  }
}

buildViewAllWidget(tx1) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            tx1,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
          ),
          const Spacer(),
          const Text(
            "View all",
            style: TextStyle(color: ColorManager.primaryColor, fontSize: 15),
          ),
          const SizedBox(width: 5,),
          const Icon(
            Icons.arrow_forward,
            color: ColorManager.primaryColor,
            size: 15,
          )
        ],
      ),
    );
