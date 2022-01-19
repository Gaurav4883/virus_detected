
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class MyBookingss extends StatefulWidget {
//   @override
//   _MyBookingssState createState() => _MyBookingssState();
// }

// final CollectionReference bookingInfo =
//     FirebaseFirestore.instance.collection("Booking Info");

// class _MyBookingssState extends State<MyBookingss> {
//   Future getBookingInfo() async {
//     List itemsList = [];
//     try {
//       await bookingInfo.get().then((querySnapshot) {
//         querySnapshot.docs.forEach((element) {
//           itemsList.add(element.data);
//         });
//       });
//       return itemsList;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   List bookingsList = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchDatabaseList();
//   }

//   fetchDatabaseList() async {
//     dynamic resultant = await getBookingInfo();

//     if (resultant == null) {
//       print("Unable to retrieve");
//     } else {
//       setState(() {
//         bookingsList = resultant;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("My Bookings Part 2"),
//       ),
//       body: Container(
//         child: ListView.builder(
//           itemCount: bookingsList.length,
//           itemBuilder: (context, index) {
//             return Card(
//                 child: ListTile(
//               title: Text(bookingsList[index]["car_name"]),
//               subtitle: Text(bookingsList[index]["Booking days"]),
//               leading: CircleAvatar(
//                 child: Image(
//                   image: AssetImage(bookingsList[index]['car_image']),
//                 ),
//               ),
//               trailing: Text(bookingsList[index]['Driver Needed']),
//             ));
//           },
//         ),
//       ),
//     );
//   }
// }
