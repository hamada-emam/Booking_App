import 'package:booking_app/src/app/core/utils/assets_manager.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotel_image.dart';
import 'package:flutter/material.dart';

class DetailsReview extends StatelessWidget {
  final String userImage, name, review;
  const DetailsReview({
    Key? key,
    required this.name,
    required this.userImage,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  AssetsManager.deluxeRoom,
                  height: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "last update 21 may,2022",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    "(9.0)",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          Text(
            review,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
