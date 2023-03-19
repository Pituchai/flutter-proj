import 'package:authflutter/provider/auth_provider.dart';
import 'package:authflutter/screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  

void main() async {
  WidgetsFlutterBinding.ensureInitialized() ; 
  await Firebase.initializeApp() ; 
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
        title: "FlutterPhoneAuth",
      ),
    ); 
    }
}