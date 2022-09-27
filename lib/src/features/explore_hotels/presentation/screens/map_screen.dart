// import 'package:booking_app/src/app/core/core.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MapScreen extends StatelessWidget {
//   final String locationName;
//   const MapScreen({Key? key, required this.locationName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: MaterialButton(
//         color: mainAppColor,
//         onPressed: () {
//           openGoogleMaps(address: locationName);
//         },
//         child: const Text("Open Google Map", style: TextStyle(color: Colors.white),),
//       ),
//     );
//   }

//   Future<void> openGoogleMaps({required String address}) async {
//     final googleUrl = Uri.https("www.google.com", "/maps/search/", {
//       "api": '1',
//       "query": address,
//     });
//     if (await canLaunchUrl(googleUrl)) {
//       await launchUrl(googleUrl);
//     } else {
//       throw 'Could not launch ${googleUrl.toString()}';
//     }
//   }
// }

import 'dart:async';

import 'package:booking_app/src/features/explore_hotels/cubit/map_cubit/map_cubit.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotels_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapScreen extends StatefulWidget {
//   final AllHotelsData? allHotelsData;
//   const MapScreen({Key? key, required this.allHotelsData}) : super(key: key);

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// MapController controller = MapController(
//   initMapWithUserPosition: false,
//   initPosition: GeoPoint(latitude: 30.033333, longitude: 31.3590117),
// );

// class _MapScreenState extends State<MapScreen> {
//   @override
//   void initState() {
//     widget.allHotelsData!.data!.forEach((element) {
//       controller.addMarker(
//           markerIcon: MarkerIcon(icon: Icon(Icons.safety_check)),
//           GeoPoint(latitude: 31.3590117, longitude: 30.0504042));
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await controller.goToLocation(
//               GeoPoint(latitude: 31.3590117, longitude: 30.0504042));
//         },
//       ),
//       body: OSMFlutter(
//         controller: controller,
//         showDefaultInfoWindow: true,

//         initZoom: 12,
//         minZoomLevel: 8,
//         maxZoomLevel: 14,
//         stepZoom: 1.0,
//         //androidHotReloadSupport: true,
//         isPicker: false,

//         userLocationMarker: UserLocationMaker(
//           personMarker: MarkerIcon(
//             icon: Icon(
//               Icons.location_history_rounded,
//               color: Colors.red,
//               size: 100,
//             ),
//           ),
//           directionArrowMarker: MarkerIcon(
//             icon: Icon(
//               Icons.double_arrow,
//               size: 48,
//             ),
//           ),
//         ),
//         markerOption: MarkerOption(
//             defaultMarker: MarkerIcon(
//           icon: Icon(
//             Icons.person_pin_circle,
//             color: Colors.blue,
//             size: 56,
//           ),
//         )),
//       ),
//     );
//   }
// }

class MapScreen extends StatelessWidget {
  final AllHotelsData allHotelsData;

  MapScreen({Key? key, required this.allHotelsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapCubit>(
      create: (context) => MapCubit(hotelsData: allHotelsData)..initMarkers(),
      child: BlocConsumer<MapCubit, MapState>(
        buildWhen: (previous, current) =>
            current is MapInitial ||
            current is MapCreatedState ||
            current is MarkerPressedState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                markers: MapCubit.get(context).marker.toSet(),
                // on below line setting camera position
                initialCameraPosition: MapCubit.get(context).kInitialPosition,
                // on below line specifying map type.
                mapType: MapType.normal,
                // on below line setting user location enabled.
                myLocationEnabled: true,
                // on below line setting compass enabled.
                compassEnabled: true,
                // on beloe line specifying controller on map complete.
                onMapCreated: (GoogleMapController controller) {
                  MapCubit.get(context).controller.complete(controller);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
