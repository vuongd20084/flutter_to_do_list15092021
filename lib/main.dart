import 'package:flutter/material.dart';
import 'package:flutter_to_do_list15092021/add_note_page.dart';
import 'package:flutter_to_do_list15092021/edit_note_page.dart';
import 'package:flutter_to_do_list15092021/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/list",
      routes: {
        "/list" : (context) => ListPage(),
        "/add" : (context) => AddNotePage(),
        "/edit" : (context) => EditNotePage(),
      },

    );
  }
}


