import 'package:booking_app/src/app/core/components/text_form_fields/search_form_field.dart';
import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/explore_hotels/presentation/components/hotel_item.dart';
import 'package:flutter/material.dart';

import '../../../../app/config/routes/routes.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.map_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SearchTextFormField(
                        hintText: 'Search',
                        controller: searchController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      elevation: 3,
                      backgroundColor: mainAppColor,
                      child: const Icon(
                        Icons.search,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Choose date",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("21, Sep - 26, Sep"),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Number of Room",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("1 Room 2 People"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 30,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                const Expanded(child: Text("530 Hotel found")),
                const Text("Filter"),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(Routes.filter);
                  },
                  child: const Icon(
                    Icons.filter_list,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const HotelItem(),
                separatorBuilder: (context, index) => const SizedBox(height: 25,),
                itemCount: 10,
            ),
          ),
          
        ],
      ),
    );
  }
}
