import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DrinkCard2 extends StatelessWidget {
  final int price;
  final String drinkName;
  final String imgUrl;
  const DrinkCard2({
    super.key,
    required this.price,
    required this.drinkName,
    required this.imgUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      height: 240,
      width: 260,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 76, 66),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(220),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('$price \$',
                    style: const TextStyle(
                      fontSize: 25,
                    ))),
          ),
          Container(
            width: 220,
            height: 220,
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.red,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                child: (Text(
                  drinkName,
                  style: const TextStyle(
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
