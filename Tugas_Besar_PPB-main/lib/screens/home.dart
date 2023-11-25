import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_besar/screens/detail1.dart';

class ToyotaPage extends StatelessWidget {
  final List nama = [
    "Corolla",
    "Corolla Cross",
    "Corolla Hybrid",
    "Camry",
    "Yaris",
    "Supra",
    "GR Supra",
    "Prius",
    "RAV4",
    "BZ4X",
    "IS 500",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 107, 105, 105),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('List Mobil Toyota'),
      ),
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: nama.length,
      itemBuilder: (_, index) => Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 450.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("toyota.jpg"),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text((nama[index]),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage1(item: nama[index], title: nama[index])));
            }),
      ),
    );
  }
}
