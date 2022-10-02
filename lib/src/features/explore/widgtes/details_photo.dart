import 'package:booking_app/src/features/explore_hotels/data/models/hotel_image.dart';
import 'package:flutter/material.dart';

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
          itemCount: photos.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Card(
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'http://api.mahmoudtaha.com/images/${photos[index].image}',
              fit: BoxFit.fill,
              height: 150,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ));
  }
}

buildViewAllWidget(tx1) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            tx1,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
          ),
          Spacer(),
          Text(
            "View all",
            style: TextStyle(color: Colors.blue.shade800, fontSize: 15),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.blue.shade800,
            size: 15,
          )
        ],
      ),
    );
