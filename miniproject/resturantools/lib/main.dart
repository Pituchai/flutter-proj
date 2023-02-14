import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// have do something on this when create an application
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // shouldn't have appBar because it can back to the previous
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  Table(),
                  Container(color: Colors.grey, height: 4,)


                ],
              ))
        ],
      )),
    );
  }
}

class Table extends StatelessWidget {
  const Table({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Table 1",
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              "5 Sheets",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
