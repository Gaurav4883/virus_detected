import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_screen.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _formKey = GlobalKey<FormState>();
  updateUser() {
    print("User Updated");
  }

  var first_name = "";
  var last_name = "";
  var email = "";

  final first_nameController = TextEditingController();
  final last_nameController = TextEditingController();
  final emailController = TextEditingController();

  clearText() {
    first_nameController.clear();
    last_nameController.clear();
    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("                 My Profile"),
      ),
      backgroundColor: Colors.grey[200],
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  initialValue: 'Pankaj',
                  autofocus: false,
                  onChanged: (value) => {},
                  decoration: InputDecoration(
                      labelText: 'First Name:',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter First Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  initialValue: 'Shrestha',
                  autofocus: false,
                  onChanged: (value) => {},
                  decoration: InputDecoration(
                      labelText: 'Last Name:',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Last Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  initialValue: 'pankaj@gmail.com',
                  autofocus: false,
                  onChanged: (value) => {},
                  decoration: InputDecoration(
                      labelText: 'E-mail:',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter E-mail';
                    } else if (!value.contains('@')) {
                      return 'Please Enter a valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        //Validate returns true if the form is valid otherwise false
                        if (_formKey.currentState!.validate()) {
                          updateUser();
                          Fluttertoast.showToast(
                              msg: "User Updated Successfully!");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      },
                      child: Text(
                        "SAVE CHANGES",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        clearText(),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()))
                      },
                      child: Text(
                        "CLEAR",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[800]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
