import 'dart:ui';

import 'package:exercise2/Page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create An Account"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset("lib/assets/images/logo.jpg"),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                          return const RegisterScreen() ; 
                          }));
                    },
                    icon: const Icon(Icons.create),
                    label: const Text(
                      "Create account",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
