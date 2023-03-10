import 'package:citizen_calculator/screen/f_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash();
  }

  splash()
  async{
    await Future.delayed(Duration(seconds: 12)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return f_page();
    },)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
            child:Expanded(
          child: Container(
            height: double.infinity,
            //color: Colors.lightGreen,
            child: Image.asset("image/calculator+closeup+1.jpeg",fit: BoxFit.cover,),
          ),
        )),
    );
  }
}

/*
Align(
alignment: Alignment.center,
child: Text(
"Citizen Calculator",
style: TextStyle(
fontFamily: "Myfont",
color: Colors.black,
fontSize: 30,
),
)),backgroundColor: Colors.lightGreen[100],*/
