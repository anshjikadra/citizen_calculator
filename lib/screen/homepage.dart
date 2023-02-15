import 'package:action_slider/action_slider.dart';
import 'package:citizen_calculator/screen/f_page.dart';
import 'package:flutter/material.dart';

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
    nextpage();
  }

  nextpage() async {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return f_page();
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Expanded(

        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "image/calculatorupclose.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      )),
    );
  }
}
