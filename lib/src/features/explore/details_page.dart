import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/features/explore/widgtes/details_header.dart';
import 'package:booking_app/src/features/explore/widgtes/details_rate.dart';
import 'package:booking_app/src/features/explore/widgtes/details_summary.dart';
import 'package:booking_app/src/features/explore/widgtes/hotel_box_details.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotel_data.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  HotelData? hotelData;

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
                        fit: BoxFit.fill,
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
