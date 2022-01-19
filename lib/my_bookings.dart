import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({Key? key}) : super(key: key);
  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Bookings"),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('Booking Info').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Text("No Value");
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document) {
                  return Image.asset(
                    document["car_image"],
                  );
                })
                .toSet()
                .toList(),
          );
        },
      ),
    );
  }
}
