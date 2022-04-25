import 'package:flutter/material.dart';

Widget customCard(String text, String image, double height) {
  return Card(
      //All Words Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height - 40, child: Image.asset(image)),
            const SizedBox(height: 3),
            Text(text,
                style: const TextStyle(fontFamily: 'ProximaNova', fontSize: 17))
          ],
        ),
      ));
}
