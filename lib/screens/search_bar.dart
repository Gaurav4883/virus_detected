import 'package:flutter/material.dart';

Widget search_bar() {
  return TextField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.black12,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(30.0),
      ),
      hintText: "Search",
      prefixIcon: Icon(Icons.search, color: Colors.red),
      contentPadding: EdgeInsets.all(0.0),
    ),
    style: TextStyle(color: Colors.black87),
  );
}
