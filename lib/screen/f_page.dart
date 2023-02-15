import 'dart:math';

import 'package:citizen_calculator/screen/history_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../history_db/history_data_file.dart';
import '../history_db/history_db_model.dart';

class f_page extends StatefulWidget {
  const f_page({Key? key}) : super(key: key);

  @override
  State<f_page> createState() => _f_pageState();
}

class _f_pageState extends State<f_page> {

  String result="";
  var text="";
  String storevalue="0";
  String sign="";
  String expression="";

  int firstNumber=0;
  int secondNumber=0 ;



  @override
  void initState() {
    super.initState();
    get_history();
  }

  get_history() async {
    s_history = await DB.gethistory();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CITIZEN",
          style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: "Myfont"),
        ),
        actions: [
          IconButton(onPressed: () {

          showCupertinoDialog(

             context: context,
             builder: (_) => CupertinoAlertDialog(
               actions: [
                 Column(
                   children: [

                     Padding(
                       padding: const EdgeInsets.fromLTRB(0,10,10,0),
                       child: Align(alignment: Alignment.topRight,child:Icon(CupertinoIcons.clear,color: Colors.black,))
                     ),
                     CupertinoDialogAction(
                       onPressed:(){

                         Navigator.push(context,MaterialPageRoute(builder: (context) {
                           return history_page(
                           );
                         },));
                       },
                       child: Text("History",style: TextStyle(color: Colors.black,fontFamily: "Myfont"),),
                     ),
                     Divider(),
                     CupertinoDialogAction(
                       onPressed:(){},
                       child: Text("Settings",style: TextStyle(color: Colors.black,fontFamily: "Myfont"),),
                     ),
                     SizedBox(height: 10,),
                   ],
                 )
               ],

             ));


          }, icon: Icon(Icons.more_vert,color: Colors.blue,)),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [

          Expanded(flex: 3,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(5,10,0,0),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Container(
                  //       height: 40,
                  //        width: 40,
                  //         // color: Colors.red,
                  //       child: Center(child: Text("${storevalue.length}",style: TextStyle(fontFamily: "Mydigital",color: Colors.black,fontSize: 20),)),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(height: 40,),
                  // Expanded(
                  //
                  //   child: Container(
                  //
                  //      color: Colors.white,
                  //     child:Padding(
                  //       padding: const EdgeInsets.all(2.0),
                  //       child: Align(alignment: Alignment.centerRight,child: Text(
                  //         storevalue,style: TextStyle(color: Colors.black,fontSize: 40,fontFamily: "Mydigital"),)),
                  //     ),
                  //     //Align(alignment: Alignment.centerRight,child: Text(result,style: TextStyle(color: Colors.black,fontSize: 25),)),
                  //
                  //   ),
                  // ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(

                      children: [
                        Container(
                          height: 45,
                          width: 45,
                      // color: Colors.blue,
                          child: Center(child: Text(sign,style: TextStyle(color: Colors.black,fontFamily:"Mydigital",fontSize: 25),)),
                        ),
                        SizedBox(width: 5,),

                        Expanded(

                          child: Container(

                             // color: Colors.white,
                            child:Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Align(alignment: Alignment.centerRight,child: Text(
                                result,style: TextStyle(color: Colors.black,fontSize: 40,fontFamily: "Mydigital"),)),
                            ),
                            //Align(alignment: Alignment.centerRight,child: Text(result,style: TextStyle(color: Colors.black,fontSize: 25),)),

                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
              decoration: BoxDecoration(
                border:Border.all( color: Colors.black38,width: 10),
                color: Colors.lightGreen[300],

              ),),
          )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // color: Colors.white,
                  child: Row(

                    children: [
                      // Container(
                      //   height: 50,
                      //   width: 105,
                      //
                      //   decoration: BoxDecoration(
                      //       color: Colors.blue,
                      //     borderRadius: BorderRadius.all(Radius.circular(5))
                      //   ),
                      //   child: Center(child: Text("Check",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Myfont"),)),
                      // ),
                      button("Check", Colors.blue, Colors.white,50,100),
                      SizedBox(width: 10,),
                      button("Delete",Colors.black87, Colors.white, 50, 100),
                      SizedBox(width: 40,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Expanded(child: Container(
                          height: 25,
                          width: 100,
                          // color: Colors.blue,
                          child: Image.asset("image/solar-cell-calculator-old-isolated-white-backghround-254742563.jpeg",fit: BoxFit.fill),

                        )),
                      ),
                      // GFButton(
                      //   onPressed: (){},
                      //   text: "Delete",textStyle: TextStyle(fontSize: 15),
                      //   color:Colors.black87,
                      //   size: 50,
                      // ),
                    ],
                  ),
                ),
              )),
          Expanded(flex: 5,child: Container(
            color: Colors.white12,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button("CE", Colors.black87, Colors.green,50,70),
                    button("7", Colors.black87, Colors.white,70,70),
                    button("4", Colors.black87, Colors.white,70,70),
                    button("1", Colors.black87, Colors.white,70,70),
                    button("0", Colors.black87, Colors.white,70,70),


                  ],

                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button("GT", Colors.grey, Colors.black,50,70),

                    button("8", Colors.black87, Colors.white,70,70,),
                    button("5", Colors.black87, Colors.white,70,70),
                    button("2", Colors.black87, Colors.white,70,70),
                    button("00", Colors.black87, Colors.white,70,70),
                  ],

                ),
                Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button("+/-", Colors.grey, Colors.black,50,70),
                    button("9", Colors.black87, Colors.white,70,70),
                    button("6", Colors.black87, Colors.white,70,70),
                    button("3", Colors.black87, Colors.white,70,70),
                    button(".", Colors.black87, Colors.white,70,70),
                  ],

                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button("√", Colors.grey, Colors.black,50,70),
                    button("×", Colors.black87, Colors.white,70,70),
                    button("-", Colors.black87, Colors.white,70,70),
                    button("+", Colors.black87, Colors.white,160,70),


                    // inputButton("CE"),
                    // inputButton("CE"),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button("AC", Colors.green, Colors.white,50,70),
                    button("%", Colors.black87, Colors.white,70,70),
                    button("÷", Colors.black87, Colors.white,70,70),
                    button("=", Colors.black87, Colors.white,160,70),

                    // inputButton("CE"),
                    // inputButton("CE"),


                  ],
                )
              ],
            ),

          ))
        ],
      ),
    );
  }


  Widget button(String buttontext,Color buttoncolor,Color buttontextcolor,double buttonheight,double buttonwidth)
  {

    return InkWell(
      onTap: () => buttonpress(buttontext),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: buttonheight,
          width: buttonwidth,
          decoration: BoxDecoration(
              color: buttoncolor,
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Center(child: Text(buttontext,style: TextStyle(color:buttontextcolor,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Myfont"),)),
        ),
      ),
    );

  }

  buttonpress(String buttontext)
  {
    setState(() {

      if(buttontext=="AC")
        {
          storevalue="0";
          result="0";
        }
      else if(buttontext=="=")
        {

            expression=result;
            expression =expression.replaceAll('×','*');
            expression =expression.replaceAll('÷','/');
            try
            {
              Parser p = Parser();
              Expression exp = p.parse(expression);
              ContextModel cm=ContextModel();
              result='${exp.evaluate(EvaluationType.VECTOR, cm)}';

              DB.save(H_data(history_data:result));
              sign="=";


            }catch(e){

              result="EROOR";
            }
        }


      else if(buttontext=="CE")
      {
        if(result=="EROOR")
        {
          result="";
        }
        result="0";

      }

      else if(buttontext=="Check")
        {
        }
      else if(buttontext=="Delete")
        {
          if(result=="EROOR")
            {
              result="";
              setState(() {

              });
            }
          result=result.substring(0,result.length-1);
          if(result=="")
          {
            result="";

          }
        }
      else if(buttontext=="GT")
      {}
      else
      {
        if(result.length<=15)
          {
                result= result + buttontext;
          }
        if(buttontext=="+" || buttontext=="-" || buttontext=="÷" || buttontext=="=" || buttontext=="×" || buttontext=="%" || buttontext=="+/-"  || buttontext=="√")
        {
          setState(() {
            sign=buttontext;
          });
        }

      }
      // setState(() {
      //   result=result;
      //   print("TEXT:${result}");
      // });


    });

  }




  // String operation = "";
  //
  // void calculate(String buttontext ) {
  //   if (buttontext == "AC") {
  //     result = "";
  //     text = "";
  //     firstNumber = 0;
  //     secondNumber = 0;
  //   }else if(buttontext=="CE")
  //     {
  //       result="0";
  //       setState(() {
  //
  //       });
  //     }
  //   else if(buttontext=="Delete")
  //     {
  //      result=result.substring(0,result.length-1);
  //      setState(() {
  //
  //      });
  //
  //     }
  //
  //
  //   else if (buttontext == "+" ||
  //       buttontext == "-" ||
  //       buttontext == "×" ||
  //       buttontext == "÷" ||
  //   buttontext == "%") {
  //
  //
  //     firstNumber = int.parse(text);
  //     result = "";
  //     operation = buttontext;
  //
  //
  //
  //
  //     firstNumber = int.parse(text);
  //     result = "0";
  //     operation = buttontext;
  //
  //   } else if (buttontext == "=") {
  //     secondNumber = int.parse(text);
  //     if (operation == "+") {
  //       result = (firstNumber + secondNumber).toString();
  //     }
  //     if (operation == "-") {
  //       result = (firstNumber - secondNumber).toString();
  //     }
  //     if (operation == "×") {
  //       result = (firstNumber * secondNumber).toString();
  //     }
  //     if (operation == "÷") {
  //       result = (firstNumber ~/ secondNumber).toString();
  //     }
  //     if(operation=="%")
  //       {
  //         result=(firstNumber % secondNumber).toString();
  //       }
  //    DB.save(H_data(history_data:result));
  //     setState(() {
  //
  //     });
  //
  //
  //   } else {
  //
  //     if(buttontext=="+" || buttontext=="-" || buttontext=="÷" || buttontext=="-" || buttontext=="✕" || buttontext=="%" || buttontext=="+/-"  || buttontext=="√")
  //                 {
  //
  //                   setState(() {
  //                     sign=buttontext;
  //                     print(sign);
  //                   });
  //                 }
  //                 else
  //                   {
  //
  //                   }
  //
  //
  //
  //   }
  //     result = int.parse(text + buttontext).toString();
  //     print("result:${result}");
  //   setState(() {
  //     text = result;
  //     print("Text:${text}");
  //   });
  // }


  
}
