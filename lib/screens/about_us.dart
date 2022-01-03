import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "           About Us",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: Colors.black12,
        body: Container(
          child: Center(
            child: Image.asset(
              "assets/images/aboutus.jpg",
            ),
          ),
        ));
  }
}
