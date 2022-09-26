import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,left: 10,right: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade300),
            ),
          ),
          child: ListTile(
            title: Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
            trailing: Icon(
              icon,
              size: 25,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
