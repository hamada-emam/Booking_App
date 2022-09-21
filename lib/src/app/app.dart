import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/core.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      initialRoute: Routes.getStarted,
    );
  }
}
