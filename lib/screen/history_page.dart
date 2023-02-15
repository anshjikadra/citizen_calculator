import 'package:citizen_calculator/screen/f_page.dart';
import 'package:flutter/material.dart';

import '../history_db/history_data_file.dart';
import '../history_db/history_db_model.dart';

class history_page extends StatefulWidget {
  const history_page({Key? key}) : super(key: key);

  @override
  State<history_page> createState() => _history_pageState();
}

class _history_pageState extends State<history_page> {


  @override
  void initState() {
    super.initState();
    get_history();
  }

  get_history() async {
    s_history = await DB.gethistory();
    // s_value = await DB.gethistory();
    setState(() {});
  }



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

      body: ListView.builder(itemCount: s_history.length,itemBuilder: (context, index) {
        return ListTile(
          title: Text(s_history[index].history_data,style: TextStyle(color: Colors.black,fontFamily: "Myfont")),
         // leading: Text(s_value[index].value_data,style: TextStyle(color: Colors.black,fontFamily: "Myfont"),),
        );
      },),
    );
  }
}
