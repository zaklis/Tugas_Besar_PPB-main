import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_besar/screens/detail1.dart';

class AudiPage extends StatelessWidget {
  final List nama = [
    "a4",
    "a3",
    "a5 quatro",
    "r8",
    "s4",
    "q3",
    "q4",
    "q5",
    "tt coupe",
    "tts coupe",
    "a8",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 107, 105, 105),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('List Mobil Audi'),
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
              backgroundImage: AssetImage("assets/audi1.jpg"),
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
