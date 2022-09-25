import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/config/routes/routes.dart';
import '../../cubit/explore_cubit.dart';
import '../components/hotel_item.dart';

class HotelsResultScreen extends StatelessWidget {
  const HotelsResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              // Text("${exploreCubit.allHotelsData!.data!.length} Hotels found"),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BlocConsumer<ExploreCubit, ExploreStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
              condition: exploreCubit.allHotelsData != null,
              builder: (context) => Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => HotelItem(
                      hotelData: exploreCubit.allHotelsData!.data![index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25,
                  ),
                  itemCount: exploreCubit.allHotelsData!.data!.length,
                ),
              ),
              fallback: (context) => Expanded(
                child: Center(
                  child: CircularProgressIndicator(color: mainAppColor, strokeWidth: 3),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
