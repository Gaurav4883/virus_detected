import 'package:authentication/model/user_model.dart';
import 'package:authentication/my_bookings.dart';
import 'package:authentication/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'about_us.dart';
import 'login_screen.dart';
import 'my_profile.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

_signOut() async {
  await _firebaseAuth.signOut();
}

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  //Receiving Data from Cloud Fire Store
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  "Hi, ${loggedInUser.firstName}!",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  "${loggedInUser.email}",
                  style: TextStyle(color: Colors.white),
                ),
              ]),
            ),
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "My Profile",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfile()),
                );
              }),
          ListTile(
              leading: Icon(Icons.book_online),
              title: Text(
                "My Bookings",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBookings()),
                );
              }),
          ListTile(
              leading: Icon(Icons.reset_tv),
              title: Text(
                "Reset Password",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }),
          ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () async {
                await _signOut();
                if (_firebaseAuth.currentUser == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
              }),
          ListTile(
              leading: Icon(Icons.info),
              title: Text(
                "About us",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              }),
        ],
      ),
    );
  }
}
