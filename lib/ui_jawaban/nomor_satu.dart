import 'package:flutter/material.dart';
import 'package:uas/logic_jawaban.dart/jawaban_satu.dart';
import 'package:uas/ui_jawaban/nomor_satu_delete.dart';
import 'package:uas/ui_jawaban/nomor_satu_get.dart';
import 'package:uas/ui_jawaban/nomor_satu_put.dart';

class NomorSatu extends StatefulWidget {
  @override
  _NomorSatuState createState() => _NomorSatuState();
}

class _NomorSatuState extends State<NomorSatu> {
  PostResult postResult = null;

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      hintText: ("Tulis Nama Kamu Disini Bro!")),
                  controller: controller1,
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: ("Tulis Job Kamu Disini Bro!")),
                  controller: controller2,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: ("Tulis Umur Kamu Disini Bro!")),
                  controller: controller3,
                ),
                RaisedButton(
                  child: Text("POST"),
                  onPressed: () {
                    PostResult.connecToAPI(controller1.text, controller2.text,
                            controller3.text)
                        .then((value) {
                      postResult = value;
                      setState(() {});
                    });
                  },
                ),
                RaisedButton(
                  child: Text("GET"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SecondPage();
                        },
                      ),
                    );
                  },
                ),
                RaisedButton(
                  child: Text("PUT"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PutApp();
                        },
                      ),
                    );
                  },
                ),
                RaisedButton(
                  child: Text("DELETE"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DeleteApp();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
