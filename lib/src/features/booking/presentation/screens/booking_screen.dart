import 'package:booking_app/src/features/booking/presentation/components/room_details.dart';
import 'package:flutter/material.dart';
import '../../../explore_hotels/data/models/hotel_data.dart';

class BookingScreen extends StatelessWidget {
  final HotelData hotelData;
  const BookingScreen({Key? key, required this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          "${hotelData.name}",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border)))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            RoomDetails(roomType: 'Deluxe Room', pricePerNight: 180),
            RoomDetails(roomType: 'Premium Room', pricePerNight: 200),
            RoomDetails(roomType: 'Queen Room', pricePerNight: 240),
            RoomDetails(roomType: 'King Room', pricePerNight: 240),
            RoomDetails(roomType: 'Hollywood Twin Room', pricePerNight: 260),
          ],
        ),
      ),
    );
  }
}
