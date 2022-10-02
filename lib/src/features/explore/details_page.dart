import 'dart:async';

import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/features/explore/widgtes/details_header.dart';
import 'package:booking_app/src/features/explore/widgtes/details_photo.dart';
import 'package:booking_app/src/features/explore/widgtes/details_rate.dart';
import 'package:booking_app/src/features/explore/widgtes/details_review.dart';
import 'package:booking_app/src/features/explore/widgtes/details_summary.dart';
import 'package:booking_app/src/features/explore/widgtes/hotel_box_details.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotel_data.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotels_data_model.dart';
import 'package:booking_app/src/features/explore_hotels/presentation/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Details extends StatelessWidget {
  HotelData? hotelData;
  Completer<GoogleMapController> mcontroller = Completer();
  @override
  Widget build(BuildContext context) {
    hotelData = ModalRoute.of(context)!.settings.arguments as HotelData;
    return Scaffold(
      backgroundColor: ColorMangerH.appBgColor,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: false,
                  expandedHeight: 200,
                  collapsedHeight: MediaQuery.of(context).size.height - 20,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        'http://api.mahmoudtaha.com/images/${hotelData!.hotelImages![0].image}',
                        fit: BoxFit.cover,
                      ),
                      collapseMode: CollapseMode.pin,
                      titlePadding: EdgeInsets.zero,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          HotelBoxDetails(hotelData: hotelData!),
                          Card(
                            shape: StadiumBorder(),
                            color: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "More Details",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )),
                ),
                SliverToBoxAdapter(
                    child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      DetailsHeader(
                        hotelData: hotelData!,
                      ),
                      DetailsSummary(
                        hotelData: hotelData!.description!,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DetailsRate(
                        rate: hotelData!.rate!,
                      ),
                      buildViewAllWidget("Photo"),
                      DetailsPhoto(photos: hotelData!.hotelImages!),
                      buildViewAllWidget("Reviews"),
                      DetailsReview(
                          name: "Jacky depp",
                          userImage: " ",
                          review:
                              "good staff , very comfortable bed,viery quiet location,place do with an update"),
                      buildViewAllWidget(" "),
                      SizedBox(
                        height: 300,
                        width: 500,
                        child: GoogleMap(
                          markers: <Marker>[
                            Marker(
                                markerId: MarkerId("dfdf"),
                                position: LatLng(
                                  double.parse(hotelData!.latitude!),
                                  double.parse(hotelData!.longitude!),
                                ))
                          ].toSet(),
                          // on below line setting camera position
                          initialCameraPosition: CameraPosition(
                              zoom: 9,
                              target: LatLng(
                                double.parse(hotelData!.latitude!),
                                double.parse(hotelData!.longitude!),
                              )),
                          // on below line specifying map type.
                          mapType: MapType.normal,
                          // on below line setting user location enabled.
                          myLocationEnabled: true,
                          // on below line setting compass enabled.
                          compassEnabled: true,

                          // on beloe line specifying controller on map complete.
                          onMapCreated: (GoogleMapController controller) {
                            mcontroller.complete(controller);
                          },
                        ),
                      ),
                      MainButton(
                        txt: "Book Now",
                        isExpanded: true,
                        onPressed: () {},
                        color: Colors.blue,
                      )
                    ],
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.black38,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    )),
                GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.blue,
                            size: 25,
                          )),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
