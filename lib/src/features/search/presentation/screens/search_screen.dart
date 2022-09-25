import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/core/components/text_form_fields/app_textform_field.dart';
import '../../../../app/core/core.dart';
import '../../../explore_hotels/cubit/explore_states.dart';
import '../../../explore_hotels/presentation/components/hotel_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    exploreCubit.searchForHotels(
      searchMap: {
        'name' : exploreCubit.searchController.text,
        'max_price' : exploreCubit.selectedPriceRange.end,
        'min_price' : exploreCubit.selectedPriceRange.start,
      },
    );

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
              onFieldSubmitted: (value)
              {
                exploreCubit.searchForHotels(
                  searchMap: {
                    'name' : exploreCubit.searchController.text,
                    'max_price' : exploreCubit.selectedPriceRange.end,
                    'min_price' : exploreCubit.selectedPriceRange.start,
                  },
                );
                return '';
              },
            ),
          ),

          BlocConsumer<ExploreCubit, ExploreStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if(exploreCubit.searchHotelsData != null && state is! LoadingSearchState)
                {
                  return ConditionalBuilder(
                    condition: exploreCubit.searchHotelsData!.data!.isNotEmpty,
                    builder: (context) => Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              "${exploreCubit.searchHotelsData!.data!.length} Hotels found",
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => HotelItem(
                                  hotelData: exploreCubit.searchHotelsData!.data![index]),
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 25,
                              ),
                              itemCount: exploreCubit.searchHotelsData!.data!.length,
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
                }
              else
                {
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
