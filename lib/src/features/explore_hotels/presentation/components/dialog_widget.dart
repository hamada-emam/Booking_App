import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../app/core/core.dart';
import '../../../../app/core/utils/mediaquery_managment.dart';

class NumberOfRoomDialog extends StatefulWidget {
  const NumberOfRoomDialog({Key? key}) : super(key: key);

  @override
  State<NumberOfRoomDialog> createState() => _NumberOfRoomDialogState();
}

class _NumberOfRoomDialogState extends State<NumberOfRoomDialog> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    return AlertDialog(
      backgroundColor: mainBackgroundColor,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Room selected",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: MediaQueryManager.screenWidth,
              height: 1,
              color: mainGreyColor,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Number of Room",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    exploreCubit.numberOfRooms++;
                  });
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
              Text('${exploreCubit.numberOfRooms}'),
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    if (exploreCubit.numberOfRooms <= 1) {
                      exploreCubit.numberOfRooms = 1;
                    } else {
                      exploreCubit.numberOfRooms--;
                    }
                  });
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          // const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: Text(
                  "People",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    exploreCubit.numberOfPeople++;
                  });
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
              Text('${exploreCubit.numberOfPeople}'),
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  setState(() {
                    if (exploreCubit.numberOfPeople <= 1) {
                      exploreCubit.numberOfPeople = 1;
                    } else {
                      exploreCubit.numberOfPeople--;
                    }
                  });
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          MainButton(
            isExpanded: true,
            txt: 'Apply',
            onPressed: () {
              exploreCubit.changeNumberOfRoomsWidget();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
