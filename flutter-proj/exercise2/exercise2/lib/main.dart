import 'package:exercise2/Page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: "Exercise 2",
     theme: ThemeData(
      primarySwatch: Colors.orange ,
     ),
     home: HomePage(),
     ) ; 
  }
}


// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create account"),
//       ),
//       body: Container(
//         child: Column(children: [
//           const Text(
//             "Name",
//             style: TextStyle(fontSize: 20),
//           ),
//           TextFormField(),
//           const Text(
//             "StudentID",
//             style: TextStyle(fontSize: 20),
//           ),
//           TextFormField(),
//           const Text(
//             "E-mail",
//             style: TextStyle(fontSize: 20),
//           ),
//           TextFormField(),
//         ]),
//       ),
//     );
//   }
// }
