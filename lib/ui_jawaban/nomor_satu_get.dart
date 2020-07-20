import 'package:flutter/material.dart';
import 'package:uas/logic_jawaban.dart/jawaban_satu.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  User user = null;
  final controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: controller1,
              decoration:
                  InputDecoration(hintText: "Tulis ID Kamu Disini Bro!"),
            ),
            Text((user != null)
                ? user.name + " | " + " | " + user.id
                : "Tidak ada data"),
            RaisedButton(
              child: Text("GET"),
              onPressed: () {
                User.connectToAPI(controller1.text).then((value) {
                  user = value;
                  setState(() {});
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
