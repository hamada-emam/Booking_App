import 'package:booking_app/src/features/home/presentation/views/explore/details_page.dart';
import 'package:flutter/material.dart';

import '../../../../../app/core/utils/assets_manager.dart';
import '../../../data/models/all_hotels_data.dart';

class FeatureItem extends StatelessWidget {
  final HotelAllData hotelData;
  const FeatureItem({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 0, 5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Details()));
            },
            child: Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  hotelData.hotelImages!.isNotEmpty
                      ? Image.network(
                          'http://api.mahmoudtaha.com/images/${hotelData.hotelImages![0].image}',
                          height: 100,
                          width: 120,
                          // width: 380,
                          fit: BoxFit.cover,
                          // height: 50,
                        )
                      : Image.asset(
                          AssetsManager.hotelImage,
                          height: 100,
                          width: 120,
                          // width: 380,
                          fit: BoxFit.cover,
                          // height: 50,
                        ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${hotelData.name}",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey, fontSize: 24),
                        ),
                        Row(
                          children: [
                            Text(
                              "${hotelData.address}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
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
                            Text(
                              "/per night",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_rate_sharp,
                                size: 20,
                              ),
                              const Icon(
                                Icons.star_rate_sharp,
                                size: 20,
                              ),
                              const Icon(
                                Icons.star_rate_sharp,
                                size: 20,
                              ),
                              const Icon(
                                Icons.star_rate_sharp,
                                size: 20,
                              ),
                              const Icon(
                                Icons.star_rate_sharp,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${hotelData.rate}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
