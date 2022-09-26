import 'package:booking_app/src/features/home/presentation/views/explore/details_page.dart';
import 'package:flutter/material.dart';

import '../../../../../app/core/utils/assets_manager.dart';
import '../../../data/models/all_hotels_data.dart';

class FeatureItem extends StatelessWidget {
  final HotelAllData hotelData;

  const FeatureItem({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Details()));
        },
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${hotelData.name}",
                        style: Theme.of(context).textTheme.titleLarge,
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
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
