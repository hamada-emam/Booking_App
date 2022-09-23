import 'package:booking_app/src/app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatelessWidget {
  final String locationName;
  const MapScreen({Key? key, required this.locationName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: mainAppColor,
        onPressed: () {
          openGoogleMaps(address: locationName);
        },
        child: const Text("Open Google Map", style: TextStyle(color: Colors.white),),
      ),
    );
  }

  Future<void> openGoogleMaps({required String address}) async {
    final googleUrl = Uri.https("www.google.com", "/maps/search/", {
      "api": '1',
      "query": address,
    });
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not launch ${googleUrl.toString()}';
    }
  }
}
