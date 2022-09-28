import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/config/routes/routes.dart';
import '../../../../app/core/components/text_form_fields/app_textform_field.dart';
import '../../../../app/core/core.dart';
import '../../../explore_hotels/cubit/explore_states.dart';
import '../../../explore_hotels/presentation/components/hotel_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    exploreCubit.searchForHotels();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: AppTextFormField(
              hintText: 'Search',
              controller: exploreCubit.searchController,
              suffixIcon: Icons.search,
              onFieldSubmitted: (value) {
                exploreCubit.searchForHotels();
                return '';
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: BlocConsumer<ExploreCubit, ExploreStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Text(
                        exploreCubit.searchHotelsData != null
                            ? "${exploreCubit.searchHotelsData!.data!.length} Hotels found"
                            : "Please wait...",
                      );
                    },
                  ),
                ),
                const Text("Filter"),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed(Routes.filter);
                  },
                  child: const Icon(
                    Icons.filter_list,
                  ),
                ),
              ],
            ),
          ),
          BlocConsumer<ExploreCubit, ExploreStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (exploreCubit.searchHotelsData != null &&
                  state is! LoadingSearchState) {
                return ConditionalBuilder(
                  condition: exploreCubit.searchHotelsData!.data!.isNotEmpty,
                  builder: (context) => Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) => HotelItem(
                                hotelData: exploreCubit
                                    .searchHotelsData!.data![index]),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 25,
                            ),
                            itemCount:
                                exploreCubit.searchHotelsData!.data!.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  fallback: (context) => const Expanded(
                    child: Center(
                      child: Text("Sorry, there is no result"),
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: mainAppColor,
                      strokeWidth: 3,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
