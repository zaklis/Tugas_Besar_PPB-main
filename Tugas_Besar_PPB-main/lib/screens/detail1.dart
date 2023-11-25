import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage1 extends StatefulWidget {
  final String item;
  final String title;
  const DetailPage1({Key? key, required this.item, required this.title})
      : super(key: key);

  @override
  _DetailPage1State createState() => _DetailPage1State();
}

class _DetailPage1State extends State<DetailPage1> {
  var class1;
  var cylinders;
  var fuel;
  var make;
  var model;
  var year;

  Future getWeather(String mobil) async {
    http.Response response = await http.get(
        Uri.parse("https://api.api-ninjas.com/v1/cars?limit=2&model=$mobil"),
        headers: {'X-Api-Key': 'aQffcU93cfq49wZ6RxnpHA==5r0ZjAly4Tgo7IKB'});
    var result = jsonDecode(response.body);
    setState(() {
      this.make = result[0]['class'];
      this.cylinders = result[0]['cylinders'];
      this.fuel = result[0]['fuel_type'];
      this.make = result[0]['make'];
      this.model = result[0]['model'];
      this.year = result[0]['year'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Daftar Mobil'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 170, 170, 170),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(make.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600)),
                  ),
                  Text(model != null ? model.toString() : "Loading",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      year != null ? year.toString() : "Loading",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text("Model"),
                      trailing: Text(model != null
                          ? model.toString() + "\u00B0"
                          : "Loading"),
                    ),
                    ListTile(
                      title: Text("Fuel"),
                      trailing:
                          Text(fuel != null ? fuel.toString() : "Loading"),
                    ),
                    ListTile(
                      title: Text("Silinder"),
                      trailing: Text(
                          cylinders != null ? cylinders.toString() : "Loading"),
                    ),
                    ListTile(
                      title: Text("Tahun"),
                      trailing:
                          Text(year != null ? year.toString() : "Loading"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
