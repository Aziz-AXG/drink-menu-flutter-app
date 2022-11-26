import 'package:drink_menu/views/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drink menu',
      theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.white,
          textTheme:
              TextTheme(bodyText2: GoogleFonts.roboto(color: Colors.white))),
      home: HomePage(),
    );
  }
}
