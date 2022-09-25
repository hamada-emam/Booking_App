import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, required this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExploreCubit>(
          create: (context) => ExploreCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Motel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
            toolbarHeight: 90,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          iconTheme: IconThemeData(size: 30, color: mainAppColor),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        routes: Routes.routes,
        initialRoute: token == null ? Routes.getStarted : Routes.home,
      ),
    );
  }
}
