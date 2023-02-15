import 'package:citizen_calculator/screen/f_page.dart';
import 'package:flutter/material.dart';

class history_page extends StatefulWidget {
  const history_page({Key? key}) : super(key: key);

  @override
  State<history_page> createState() => _history_pageState();
}

class _history_pageState extends State<history_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: TextStyle(fontFamily: "Myfont",color: Colors.black),
        ),
        actions: [

          IconButton(onPressed: () {

          }, icon:Icon(Icons.delete_rounded,color: Colors.blue,) ),
        ],
        leading:  IconButton(onPressed: () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
            return f_page();
          },));

        }, icon: Icon(Icons.arrow_back_ios,color: Colors.blue,)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
