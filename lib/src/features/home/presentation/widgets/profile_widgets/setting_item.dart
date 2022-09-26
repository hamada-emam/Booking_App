import 'package:flutter/material.dart';

import '../../../../../app/core/utils/colors_manager.dart';


class SettingItem extends StatelessWidget {
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final String title;
  final GestureTapCallback? onTap;
  const SettingItem(
      {Key? key,
      required this.title,
      this.onTap,
      this.leadingIcon,
      this.leadingIconColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
          color: ColorMangerH.cardColor,
          boxShadow: [
            BoxShadow(
              color: ColorMangerH.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: leadingIcon != null
                ? [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: ColorMangerH.cardColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: ColorMangerH.shadowColor.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        leadingIcon,
                        size: 24,
                        color: leadingIconColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorMangerH.labelColor,
                      size: 14,
                    )
                  ]
                : [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: ColorMangerH.labelColor,
                      size: 14,
                    )
                  ],
          ),
        ),
      ),
    );
  }
}



// LayoutBuilder(builder: (context, constraints) {
//         return SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Container(
//             height: constraints.maxHeight,
//             child: Stack(children: <Widget>[
//               Container(color: Colors.red,height: 300,),
//               Container(
//                 margin: EdgeInsets.only(
//                   top: screen.isPhone ? 150 : 240,
//                 ),
//                 child: Column(
//                   children: [
//                     Card(
//                       elevation: 5,
//                       child: ListView.builder(
//                         itemCount: 20,
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) =>
//                             ProductItemWidget(showDeleteIconButton: true),
//                       ),
//                     ),
//                    Text("HEY"),
//                   ],
//                 ),
//               ),