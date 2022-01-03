import 'package:authentication/car_card.dart';
import 'package:authentication/model/cars.dart';
import 'package:authentication/screens/search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Car Share",
          style: TextStyle(
            fontSize: 25.0,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //Making A Drawer for navigation purpose
      drawer: MainDrawer(),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 50.0,
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  "  Book Your Favourite Car Here",
                  style: GoogleFonts.actor(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              search_bar(),
              SizedBox(
                height: 12.0,
              ),
              Container(
                padding: EdgeInsets.only(right: 140),
                child: Text(
                  "Available Cars",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
              Column(
                children: cars_list.map((e) => car_card(e, context)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<CarsModel> cars_list = [
  CarsModel(
      id: 0,
      car_img_path: "assets/images/ford.jpg",
      cars_model: "Ford Escort",
      carColor: CarColor(carsColor: Colors.blue, colorName: "Blue Chrome"),
      price: "Rs. 8,000/Day",
      speeds: "300km/h",
      acesing_time: "3.2s",
      sharp_power: "364hp",
      settings: "Automatic"),
  CarsModel(
      id: 1,
      car_img_path: "assets/images/alpharomeo.jpg",
      cars_model: "Alpha Romeo",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 25,000/Day",
      speeds: "800km/h",
      acesing_time: "8s",
      sharp_power: "600hp",
      settings: "Automatic"),
  CarsModel(
      id: 2,
      car_img_path: "assets/images/maruti.jpg",
      cars_model: "Maruti Suzuki 800",
      carColor: CarColor(carsColor: Colors.grey, colorName: "Grey"),
      price: "Rs. 5,000/Day",
      speeds: "150km/h",
      acesing_time: "2s",
      sharp_power: "200hp",
      settings: "Non-Automatic"),
  CarsModel(
      id: 3,
      car_img_path: "assets/images/datsun.jpg",
      cars_model: "Datsun Model F",
      carColor: CarColor(carsColor: Colors.grey, colorName: "Silver"),
      price: "Rs. 7,000/Day",
      speeds: "280km/h",
      acesing_time: "3.2s",
      sharp_power: "370hp",
      settings: "Non-Automatic"),
  CarsModel(
      id: 4,
      car_img_path: "assets/images/scorpio.png",
      cars_model: "Scorpio",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 14,000/Day",
      speeds: "700km/h",
      acesing_time: "6s",
      sharp_power: "500hp",
      settings: "Automatic"),
  CarsModel(
      id: 5,
      car_img_path: "assets/images/camper_van_cv.png",
      cars_model: "Caamper Van CV-200",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 8,000/Day",
      speeds: "400km/h",
      acesing_time: "3s",
      sharp_power: "300hp",
      settings: "Automatic"),
  CarsModel(
      id: 6,
      car_img_path: "assets/images/camper_van.png",
      cars_model: "Camper Van A Class",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 10,000/Day",
      speeds: "400km/h",
      acesing_time: "6s",
      sharp_power: "200hp",
      settings: "Automatic"),
  CarsModel(
      id: 7,
      car_img_path: "assets/images/hyundai_creta.jpg",
      cars_model: "Hyundai Creta",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 4,000/Day",
      speeds: "500km/h",
      acesing_time: "3s",
      sharp_power: "500hp",
      settings: "Automatic"),
  CarsModel(
      id: 8,
      car_img_path: "assets/images/mahindra_bolero_pik_up.jpg",
      cars_model: "Mahindra Bolero Pik-Up",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 5,000/Day",
      speeds: "500km/h",
      acesing_time: "4s",
      sharp_power: "700hp",
      settings: "Automatic"),
  CarsModel(
      id: 9,
      car_img_path: "assets/images/mahindra_xuv_300.jpg",
      cars_model: "Mahindra XUV-300",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 7,000/Day",
      speeds: "400km/h",
      acesing_time: "3s",
      sharp_power: "500hp",
      settings: "Automatic"),
  CarsModel(
      id: 10,
      car_img_path: "assets/images/suzuki_swift.jpg",
      cars_model: "Suzuki Swift",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 6,000/Day",
      speeds: "400km/h",
      acesing_time: "4s",
      sharp_power: "500hp",
      settings: "Automatic"),
  CarsModel(
      id: 11,
      car_img_path: "assets/images/volkswagen.jpg",
      cars_model: "Volkswagen",
      carColor: CarColor(carsColor: Colors.red, colorName: "Red"),
      price: "Rs. 8,000/Day",
      speeds: "650km/h",
      acesing_time: "2s",
      sharp_power: "600hp",
      settings: "Automatic"),
];
