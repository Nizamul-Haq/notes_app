import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/routes/add_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Notes"),
      centerTitle: true,
      ),
      body: ListView(

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddNote()));
      }),
    );
  }
}
