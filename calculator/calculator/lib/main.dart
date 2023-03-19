
import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';

  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=')
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Calculator",style:   TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer, style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          )),
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.orange,
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Mybutton(
                          buttonTap: () {
                            setState(() {
                              userQuestion = '';
                              userAnswer = '';
                            });
                          },
                          textButton: buttons[index],
                          color: Colors.green,
                          textColor: Colors.black,
                        ),
                      );
                    } else if (index == 1) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Mybutton(
                          buttonTap: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          textButton: buttons[index],
                          color: Colors.red,
                          textColor: Colors.black,
                        ),
                      );
                    } else if (index == buttons.length - 1) {
                      return Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Mybutton(
                          buttonTap: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          textButton: buttons[index],
                          color: Colors.red,
                          textColor: Colors.black,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Mybutton(
                          buttonTap: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          textButton: buttons[index],
                          // id true on the condition will be yellow if not change to white
                          color: isOperator(buttons[index])
                              ? Colors.yellow
                              : Colors.white,
                          textColor: Colors.black,
                        ),
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString() ;
    

  }
}
