import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotel_data.dart';
import 'package:flutter/material.dart';

import '../../../../app/core/utils/assets_manager.dart';
import '../../../booking/presentation/screens/booking_screen.dart';

class HotelItemInMap extends StatelessWidget {
  final HotelData hotelData;

  HotelItemInMap({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BookingScreen(hotelData: hotelData),
            ),
          );
        },
        child: Container(
          width: 350,
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
                        'http://api.mahmoudtaha.com/images/${hotelData.hotelImages![0].image}',
                        height: 150,
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${hotelData.name}",
                          style: Theme.of(context).textTheme.titleLarge,
                          maxLines: 1,
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
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
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
                            Text("\$${hotelData.price}",
                                style: Theme.of(context).textTheme.titleLarge!),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rate_sharp,
                                size: 20,
                              ),
                              const SizedBox(width: 5,),
                              Text(
                                "${hotelData.rate}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey),
                              ),
                              Spacer(),
                              Text(
                                "/per day",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
