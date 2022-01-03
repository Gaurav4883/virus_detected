import 'package:authentication/model/cars.dart';
import 'package:authentication/screens/details_screen.dart';
import 'package:flutter/material.dart';

Widget car_card(CarsModel model, BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      model: model,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 18.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "model${model.id}",
                child: Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0),
                      ),
                      image: DecorationImage(
                          image: AssetImage(model.car_img_path),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                            ),
                          ),
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.cars_model,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  )),
                              Text(
                                model.price,
                                style: TextStyle(
                                  color: Colors.indigo[600],
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          )));
}
