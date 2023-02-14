import 'package:exercise2/Page/profile_page.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Profile profile = Profile(name: "", stID: "", email: "");
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Please fill out information"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Name",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(
              child: TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                if (value == null ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value) ||
                    value.isEmpty) {
                  return 'Please enter only text';
                }
                return null;
              }, onSaved: (name) {
                profile.name = name!;
              }),
            ),

            const SizedBox(
              height: 10,
            ),
            const Text(
              "StudentID",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(
              child: TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                if (value == null ||
                    !RegExp(r'^[0-9]+$').hasMatch(value) ||
                    value.isEmpty) {
                  return 'Please enter only number';
                }
                return null;
              }, onSaved: (stID) {
                profile.stID = stID!;
              }),
            ),

            const SizedBox(
              height: 10,
            ),
            const Text(
              "E-mail",
              style: TextStyle(fontSize: 20),
            ),

            //RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            SizedBox(
              child: TextFormField(
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                if (value == null ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value) ||
                    value.isEmpty) {
                  return 'Please enter your mail correctly';
                }
                return null;
              }, onSaved: (email) {
                profile.email = email!;
              }),
            ),

            const Center(
                child: Text("All of these will show in the terminal",
                    style: TextStyle(color: Colors.red))),

            // Box Create
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  "Create",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Processing...",
                              style: TextStyle(fontSize: 20))));

                      _formKey.currentState?.save();

                      print(
                          "name: ${profile.name} Student ID: ${profile.stID} E-mail: ${profile.email}");
                    }
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
