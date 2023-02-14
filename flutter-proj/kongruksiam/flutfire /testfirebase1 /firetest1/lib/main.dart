import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  @override
  final myController = TextEditingController() ; 
  
  void initState(){
    super.initState() ; 
    myController.addListener((){}) ; 
  }   
  void dispose(){
    myController.dispose() ; 
  }

  void _printLastestValue(){
    print("Secound Text:  ${myController.text}") ;
  }

  Widget build(BuildContext context) {
    return Container();
  }
}