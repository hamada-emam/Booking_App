import 'package:flutter/material.dart';

import '../../../../app/core/core.dart';
import '../../../../app/core/utils/assets_manager.dart';

class HotelItem extends StatelessWidget {
  const HotelItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: (){},
        child: Card(
          elevation: 5,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AssetsManager.hotelImage,
                    height: 210,
                    // width: 380,
                    fit: BoxFit.cover,
                    // height: 50,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          primary: Colors.white, // <-- Button color
                          onPrimary: mainAppColor, // <-- Splash color
                        ),
                        child: const Icon(Icons.favorite_border, size: 20,),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Grand Royal Hotel",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "\$180",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Wembley, London",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        const Icon(
                          Icons.location_on,
                          size: 15,
                        ),
                        Expanded(
                          child: Text(
                            "2.0 km to city",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
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
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_sharp,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_rate_sharp,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "80 Reviews",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
