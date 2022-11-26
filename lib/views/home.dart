import 'dart:convert';
import 'package:drink_menu/views/widgets/drink_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> drinkList = [];

  var isLoading = true;

  Future getAllCategory() async {
    var baseUrl = "https://drink-menu.adaptable.app/api/drink";

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() {
        drinkList = jsonData;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'CAFE BOX',
              style: GoogleFonts.seymourOne(),
            ),
          ],
        ),
      ),
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: drinkList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrinkCard2(
                        price: drinkList[i]['price'],
                        drinkName: drinkList[i]['drinkName'],
                        imgUrl: drinkList[i]['imageName']),
                  ],
                );
              },
            ),
    );
  }
}
