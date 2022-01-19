import 'package:authentication/cars_details.dart';
import 'package:authentication/model/cars.dart';
import 'package:authentication/model/user_model.dart';
import 'package:authentication/my_bookings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.model}) : super(key: key);
  final CarsModel model;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // for checkbox
  bool value = false;
  //for dropdown box
  String? valueChoose;
  List listItem = [
    "1 Day",
    "2 Days",
    "3 Days",
    "4 Days",
    "5 Days",
    '6 Days',
    '7 Days',
    '8 Days',
    '9 Days',
    '10 Days'
  ];

  // Checking if the booking days are null or not. If it's null then we won't let user to proceed
  checkBookingDays() {
    if (valueChoose == null) {
      valueChoose = "1 Day";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /* body base layout */
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Hero(
                tag: "model${widget.model.id}",
                child: Container(
                  height: 250.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage(widget.model.car_img_path),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 12.0,
              // ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            widget.model.cars_model,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          widget.model.price,
                          style: TextStyle(
                              color: Colors.indigo[600],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   "Car Details:",
                    //   style:
                    //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        carsDetail(Icons.speed, widget.model.speeds),
                        carsDetail(
                            Icons.access_time, widget.model.acesing_time),
                        carsDetail(Icons.power_sharp, widget.model.sharp_power),
                        carsDetail(Icons.settings, widget.model.settings),
                      ],
                    ),
                  ],
                ),
              ),

              // Here we write the days needed and driver requirement
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: value,
                  title: Text(
                    "Driver Needed",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onChanged: (value) => setState(() => this.value = value!)),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Text(
                    "    Select Booking Days",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              // Here we write our drop down box for booking days
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton(
                      hint: Text(
                        "1 Day",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      dropdownColor: Colors.blueGrey[200],
                      iconSize: 30,
                      isExpanded: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      underline: SizedBox(),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(
                          () {
                            valueChoose = newValue as String?;
                          },
                        );
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    width: double.infinity,
                    height: 50.0,
                    // Book Now Button
                    child: RawMaterialButton(
                      onPressed: () {
                        checkBookingDays();
                        //sending our data to cloud firebase with booking info collection
                        Map<String, dynamic> data = {
                          "Driver Needed": value,
                          "Booking days": valueChoose,
                          "car_image": widget.model.car_img_path,
                          "car_id": widget.model.id,
                          "car_name": widget.model.cars_model,
                        };
                        FirebaseFirestore.instance
                            .collection("Booking Info")
                            .add(data);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyBookings()));

                        Fluttertoast.showToast(msg: "Booking Successfull!");

                        // DocumentSnapshot variable = await FirebaseFirestore
                        //     .instance
                        //     .collection("Booking Info")
                        //     .doc('7aFAeGnXMo6rsLVEvIb6')
                        //     .get();
                      },
                      // Book Now Button properties
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      fillColor: Colors.indigo[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          /* navigation menu */
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 32.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
