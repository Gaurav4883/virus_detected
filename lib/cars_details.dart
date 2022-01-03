import 'package:flutter/material.dart';

Widget carsDetail(IconData icon, String text) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.blueGrey[100],
    ),
    width: 80.0,
    padding: EdgeInsets.symmetric(vertical: 12.0),
    child: Column(
      children: [
        Icon(icon, size: 32.0),
        SizedBox(height: 8.0),
        Text(text, style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
  );
}
