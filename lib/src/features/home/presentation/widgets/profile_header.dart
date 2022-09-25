import 'dart:io';

import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String image;
  final bool isDark;
  const ProfileHeader({Key? key, required this.image, required this.name,this.isDark=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(
          name,
          style: getBoldStyle(fontSize: FontSize.s20),
        ),
        subtitle: const Text("View and edit profile",
            style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: SizedBox(
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
