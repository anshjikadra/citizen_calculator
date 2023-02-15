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
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child:  ActionSlider.standard(
              child: const Text('Get Start'),
              action: (controller) async {
                controller.loading(); //starts loading animation
                await Future.delayed(const Duration(seconds: 1));
                controller.success();
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                  return f_page();
                },));//starts success animation
              },
            ),
          ),
        ),
      ),

    );
  }
}
