import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUser() async {
  final response = await http.get(
      'https://thawing-stream-50060.herokuapp.com/api/users/5f159d7c849f7c00170817b9');

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

Future<User> updateUser(
  String name,
) async {
  final http.Response response = await http.put(
    'https://thawing-stream-50060.herokuapp.com/api/users/5f159d7c849f7c00170817b9',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
    }),
  );

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update user.');
  }
}

class User {
  String id;
  String name;
  String job;

  int age;

  User({
    this.id,
    this.name,
    this.job,
    this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      job: json['job'],
      age: json['age'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'job': job,
      'age': age,
    };
  }
}

class PutApp extends StatefulWidget {
  PutApp({Key key}) : super(key: key);

  @override
  _PutAppState createState() {
    return _PutAppState();
  }
}

class _PutAppState extends State<PutApp> {
  final TextEditingController _controller = TextEditingController();

  Future<User> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Update Data Example'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<User>(
                future: _futureUser,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (snapshot.data.name ?? _controller.text),
                          ),
                          TextField(
                            controller: _controller,
                            decoration:
                                InputDecoration(hintText: 'Enter Title'),
                          ),
                          RaisedButton(
                            child: Text('Update Data'),
                            onPressed: () {
                              setState(() {
                                _futureUser = updateUser(_controller.text);
                              });
                            },
                          ),
                        ],
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            RaisedButton(
              child: Text("BACK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
