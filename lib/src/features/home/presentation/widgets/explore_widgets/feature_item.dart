import 'dart:math';

import 'package:booking_app/src/features/explore/details_page.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotel_data.dart';
import 'package:flutter/material.dart';
import '../../../../../app/core/utils/assets_manager.dart';

class FeatureItem extends StatelessWidget {
  final HotelData hotelData;

  FeatureItem({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) =>const Details()));
        },
        child: Container(
          height: 160,
          child: Card(
            elevation: 5,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hotelData.hotelImages!.isNotEmpty
                    ? Image.network(
                        'http://api.mahmoudtaha.com/images/${hotelData.hotelImages![next(0, hotelData.hotelImages!.length-1)].image}',
                        height: 160,
                        width: 140,
                        // width: 380,
                        fit: BoxFit.cover,
                        // height: 50,
                      )
                    : Image.asset(
                        AssetsManager.hotelImage,
                        height: 150,
                        width: 140,
                        // width: 380,
                        fit: BoxFit.cover,
                        // height: 50,
                      ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${hotelData.name}",
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${hotelData.address}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 15,
                            ),
                            Text(
                              "2.0 km to city",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Text(
                              "\$${hotelData.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                            ),
                          ],
                        ),
                        Row(
                          children: [

                            const Icon(
                              Icons.star_rate_sharp,
                              size: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "${hotelData.rate}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                            const Spacer(),
                            Text(
                              "/per day",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  final random = Random();

  int next(int min, int max) => min + random.nextInt(max - min);
}
