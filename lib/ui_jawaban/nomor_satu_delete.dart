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

Future<User> deleteUser(String name, String job, String age) async {
  final http.Response response = await http.delete(
    'https://thawing-stream-50060.herokuapp.com/api/users/5f159d7c849f7c00170817b9',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete user.');
  }
}

class User {
  String id;
  String name;
  String job;
  String created;
  int age;

  User({
    this.id,
    this.name,
    this.job,
    this.created,
    this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      job: json['job'],
      created: json['createdAt'],
      age: json['age'],
    );
  }
}

class DeleteApp extends StatefulWidget {
  DeleteApp({Key key}) : super(key: key);

  @override
  _DeleteAppState createState() {
    return _DeleteAppState();
  }
}

class _DeleteAppState extends State<DeleteApp> {
  Future<User> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delete Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delete Data Example'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: FutureBuilder<User>(
                future: _futureUser,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('${snapshot.data?.name ?? 'Deleted'}'),
                          RaisedButton(
                            child: Text('Delete Data'),
                            onPressed: () {
                              setState(() {
                                _futureUser = deleteUser(
                                    snapshot.data.id.toString(),
                                    snapshot.data.name,
                                    snapshot.data.job);
                              });
                            },
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
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
