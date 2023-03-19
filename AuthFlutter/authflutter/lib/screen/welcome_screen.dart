import 'package:authflutter/provider/auth_provider.dart';
import 'package:authflutter/screen/home_screen.dart';
import 'package:authflutter/screen/register_screen.dart';
import 'package:authflutter/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ap = app provider
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image1.png",
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Let's get started ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Never a better time than now to start.",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    //  to go to home page or come to auth provider
                    // or when true, then fetch to the preferences data.
                    ap.isSignedIn == true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                  },
                  text: "Get Start",
                ),
              )
            ],
          ),
        ),
      )),
    );
 
  }
  
  
}
