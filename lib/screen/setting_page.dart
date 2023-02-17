

import 'dart:io';

import 'package:citizen_calculator/screen/f_page.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';


class setting_page extends StatefulWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  State<setting_page> createState() => _setting_pageState();
}

class _setting_pageState extends State<setting_page> {


  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 2,
    googlePlayIdentifier: 'gujarati.kids.learning',
    appStoreIdentifier: '1661741363',
  );




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: "Myfontlight")),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return f_page();
                  },
                ));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.lightBlue,
              )),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: (){
                rating();
              },
              title: Text(
                "Rate Us",
                style: TextStyle(
                    fontFamily: "Myfontlight",
                    color: Colors.black,
                    fontSize: 20),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.star_border_sharp,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              endIndent: 25,
              indent: 25,
            ),
            ListTile(
              title: Text(
                "Feedback",
                style: TextStyle(
                    fontFamily: "Myfontlight",
                    color: Colors.black,
                    fontSize: 20),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.feedback_outlined,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              endIndent: 25,
              indent: 25,
            ),
            ListTile(
              title: Text(
                "Share",
                style: TextStyle(
                    fontFamily: "Myfontlight",
                    color: Colors.black,
                    fontSize: 20),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.share,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              endIndent: 25,
              indent: 25,
            ),
            ListTile(
              title: Text(
                "More Apps",
                style: TextStyle(
                    fontFamily: "Myfontlight",
                    color: Colors.black,
                    fontSize: 20),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(
                  Icons.app_registration_sharp,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              endIndent: 25,
              indent: 25,
            ),
          ],
        ));
  }


  rating()
  {

    rateMyApp.showStarRateDialog(
      context,
      title: 'Rate this app',
      // The dialog title.
      message:"You like this app ? Then take a little bit of your time to leave a rating :",
      actionsBuilder: (context, stars) {

        return [
          TextButton(
            child: const Text('OK',style: TextStyle(fontFamily: "Myfontlight",color: Colors.black),),
            onPressed: () async {
              print('Thanks for the ' +
                  (stars == null ? '0' : stars.round().toString()) + ' star(s) !');

              await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
              Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);

            },
          ),
        ];
      },
      ignoreNativeDialog: Platform.isAndroid,
      dialogStyle: const DialogStyle(
        titleAlign: TextAlign.center,
        messageAlign: TextAlign.center,
        messagePadding: EdgeInsets.only(bottom: 20),
      ),
      starRatingOptions: const StarRatingOptions(),
      onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
    );

  }







}

