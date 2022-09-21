import 'package:flutter/material.dart';

import '../../../../app/core/components/buttons/main_button.dart';
import '../../../../app/core/utils/assets_manager.dart';

class RoomDetails extends StatelessWidget {
  final String roomType;
  final int pricePerNight;
  const RoomDetails({Key? key, required this.roomType, required this.pricePerNight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetsManager.hotelImage,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          // height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Expanded(
                    child: Text(
                      roomType,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                      width: 110,
                      height: 40,
                      child: MainButton(
                        txt: 'Book now',
                        onPressed: () {},
                      ))

                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "\$$pricePerNight",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "/per night",
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'sleeps 2 people + 2 children',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "More details",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
