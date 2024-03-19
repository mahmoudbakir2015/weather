import 'package:flutter/material.dart';

Padding buildBoldText({
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 10,
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    ),
  );
}

Expanded buildAdditInfo({
  required String degree,
  required String image,
  required String name,
}) {
  return Expanded(
    child: Column(
      children: [
        buildLightText(
          text: degree,
        ),
        Image(
          height: 30,
          image: AssetImage(image),
        ),
        buildLightText(
          text: name,
        ),
      ],
    ),
  );
}

Text buildLightText({
  required String text,
}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.blue,
      fontSize: 20,
    ),
  );
}
