import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking_app/src/features/explore_hotels/data/models/hotels_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  AllHotelsData? hotelsData;
  Completer<GoogleMapController> controller = Completer();

  MapCubit({required this.hotelsData}) : super(MapInitial());
  static MapCubit get(BuildContext context) => BlocProvider.of(context);

  // on below line we have created list of markers
  List<Marker> marker = [];
  //add markers from hotels Data
  initMarkers() {
    if (hotelsData != null) {
      hotelsData!.data!.forEach((hotel) {
        marker.add(
          Marker(
              markerId: MarkerId(hotel.hashCode.toString()),
              position: LatLng(double.parse(hotel.latitude!),
                  double.parse(hotel.longitude!)),
              infoWindow: InfoWindow(
                title: hotel.name,
                snippet: (hotel.address!),
                onTap: () {
                  //Todo: show 
                //  emit(MarkerPressedState());
                  print("______________________" + hotel.toString());
                },
              )),
        );
      });
    }
    emit(MapCreatedState());
  }

  //map center to cairo
  static const LatLng _kMapCenter = LatLng(30.033333, 31.3590117);
  //map cam position dircted to cairo
  final CameraPosition kInitialPosition = const CameraPosition(
      target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
}
