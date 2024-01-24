import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<User>> _userList;
  Future<List<User>> fetchUser() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      print('OK');
      List<dynamic> responseJson = json.decode(response.body);
      return responseJson.map((m) => new User.fromJson(m)).toList();
    } else {
      throw Exception('error :(');
    }
  }

  @override
  void initState() {
    super.initState();
    _userList = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(child: Text('1')));
  }
}

class User {
  final int id;
  final String title;
  final String image;
  final String profile;

  User({
    required this.id,
    required this.title,
    required this.image,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      title: json['title'],
      image: json['url'],
      profile: json['thumbnailUrl'],
    );
  }
}

//if (Snapshot.hashData) (
 // List<User>? user = snapshot.data;
  //retnrn Listview.builder (
    //itomcont:user?.length,
    //itombuilder:(BuildContext context,index) (
      //retnrn Container(
        //child: ,
    //  )
    //)
  //)
//)