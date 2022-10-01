import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/components/text_form_fields/app_textform_field.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/features/explore/data/models/popular_destination_model.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_states.dart';
import 'package:booking_app/src/features/home/presentation/widgets/explore_widgets/destination_item.dart';
import 'package:booking_app/src/features/home/presentation/widgets/explore_widgets/feature_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class HomeExplore extends StatelessWidget {


  List<PopularDestination> popularDestination = [
    PopularDestination(countryName: "Egypt", imagePath: 'assets/images/egypt.jpg'),
    PopularDestination(countryName: "Dubai", imagePath: 'assets/images/dubai.jpg'),
    PopularDestination(countryName: "Rome", imagePath: 'assets/images/italy.jpg'),
    PopularDestination(countryName: "London", imagePath: 'assets/images/london.jpg'),
    PopularDestination(countryName: "Paris", imagePath: 'assets/images/paris.jpg'),
    PopularDestination(countryName: "Venice", imagePath: 'assets/images/venice.jpg'),
  ];

  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    exploreCubit.getAllHotels();
    exploreCubit.getAllFacilities();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: AppTextFormField(
          hintText: "Search",
          hasShadow: false,
          suffixIcon: Icons.search,
          controller: ExploreCubit.get(context).searchController,
          onFieldSubmitted: (value) {
            Navigator.pushNamed(context, Routes.search);
            return '';
          },
        ),
      ),
      body: NestedScrollView(
        // physics:
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400.0,
              pinned: true,
              elevation: 0,
              stretch: true,
              // floating: true,
              // snap: true,
              flexibleSpace: FlexibleSpaceBar(
                // stretchModes: [StretchMode.fadeTitle],
                // collapseMode: CollapseMode.none,
                expandedTitleScale: 1,
                // collapseMode: CollapseMode.none,
                centerTitle: true,
                title: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 550,
                        autoPlay: true,
                        viewportFraction: 1,
                        pageSnapping: true,
                      ),
                      items: List.generate(
                        popularDestination.length,
                        (index) => Image.asset(
                          popularDestination[index].imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    // Positioned(
                    //   bottom: 15,
                    //   left: 30,
                    //   child: SizedBox(
                    //     width: 130,
                    //     child: MainButton(
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, Routes.exploreHotels);
                    //       },
                    //       txt: "View Hotels",
                    //     ),
                    //   ),
                    // )
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,200,0,20),
                        child: Container(
                          width: 130,
                          child: MainButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.exploreHotels);
                            },
                            txt: "View Hotels",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            // populer destination title
            // populer destination cards
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                children: const [
                  Text(
                    "Popular Destinations",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorMangerH.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            BlocConsumer<ExploreCubit, ExploreStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  height: 180,
                  child: ConditionalBuilder(
                    condition: exploreCubit.allHotelsData != null,
                    builder: (context) => CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        // enlargeCenterPage: true,
                        disableCenter: true,
                        viewportFraction: .8,
                      ),
                      items: List.generate(
                        popularDestination.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DestinationItem(popularDestination: popularDestination[index]),
                        ),
                      ),
                    ),
                    fallback: (context) => const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.primaryColor, strokeWidth: 3),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // best deals
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Best Deals",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorMangerH.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      "view all",
                      style: TextStyle(color: ColorManager.primaryColor),
                    ),
                    icon: const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: ColorManager.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            BlocConsumer<ExploreCubit, ExploreStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return ConditionalBuilder(
                  condition: exploreCubit.allHotelsData != null,
                  builder: (context) => Column(
                    children: List.generate(
                      exploreCubit.allHotelsData!.data!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: FeatureItem(
                          hotelData: exploreCubit.allHotelsData!.data![index],
                        ),
                      ),
                    ),
                  ),
                  fallback: (context) => const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryColor,
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
