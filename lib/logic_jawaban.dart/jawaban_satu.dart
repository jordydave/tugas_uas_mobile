import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created;
  int age;

  PostResult({
    this.id,
    this.name,
    this.job,
    this.created,
    this.age,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['_id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
      age: object['age'],
    );
  }

  static Future<PostResult> connecToAPI(
      String name, String job, String age) async {
    String apiURL = "https://thawing-stream-50060.herokuapp.com/api/users";

    var apiResult = await http.post(apiURL, body: {
      "name": name,
      "job": job,
      "age": age,
    });

    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}

Future<Change> updateUser(
  String name,
) async {
  final http.Response response = await http.put(
    'https://thawing-stream-50060.herokuapp.com/api/users/5f155582849f7c00170817b5',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
    }),
  );

  if (response.statusCode == 200) {
    return Change.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update user.');
  }
}

class Change {
  String id;
  String name;
  String job;
  String created;
  int age;

  Change({
    this.id,
    this.name,
    this.job,
    this.created,
    this.age,
  });

  factory Change.fromJson(Map<String, dynamic> json) {
    return Change(
      id: json['_id'],
      name: json['name'],
      job: json['job'],
      created: json['createdAt'],
      age: json['age'],
    );
  }
}

class Delete {
  String id;
  String name;
  String job;
  String created;
  int age;

  Delete({
    this.id,
    this.name,
    this.job,
    this.created,
    this.age,
  });

  factory Delete.fromJson(Map<String, dynamic> json) {
    return Delete(
      id: json['_id'],
      name: json['name'],
      job: json['job'],
      created: json['createdAt'],
      age: json['age'],
    );
  }
}

Future<Delete> deleteUser(String name, String job, String age) async {
  final http.Response response = await http.delete(
    'https://thawing-stream-50060.herokuapp.com/api/users/5f155582849f7c00170817b5',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Delete.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['_id'].toString(),
        name: object['name'] + " " + object['job']);
  }

  static Future<User> connectToAPI(String _id) async {
    String apiURL =
        "https://thawing-stream-50060.herokuapp.com/api/users/" + _id;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);

    return User.createUser(jsonObject);
  }
}
