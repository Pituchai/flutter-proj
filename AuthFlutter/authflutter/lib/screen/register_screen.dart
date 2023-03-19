import 'package:authflutter/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  // when reset state have to override
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country seletedCountry = Country(
      phoneCode: "66",
      countryCode: "TH",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Thailand",
      example: "Thailand",
      displayName: "Thailand",
      displayNameNoCountryCode: "TH",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    //  reverse the text position  to the right (left to right)
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Image.asset("assets/image2.png"),
                Title(
                  color: Colors.black,
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Add your phone number to get the verification code",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.purple,
                  controller: phoneController,
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  // we have to update when the value is change
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  // decoration is like designing this textfield
                  decoration: InputDecoration(
                      hintText: "Enter the phone number",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey.shade100),
      
                      // design the box
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black12)),
      
                      // do inside the box
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 550,
                                ),
                                onSelect: (value) {
                                  // set state to change the selected Country
                                  setState(() {
                                    seletedCountry = value;
                                  });
                                });
                          },
                          child: Text(
                            "${seletedCountry.flagEmoji}  ${seletedCountry.phoneCode}",
      
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // pop up Correct Icon
                      suffixIcon: phoneController.text.length > 9
                          ? Container(
                              margin: const EdgeInsets.all(10.0),
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          : null),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                      text: "Login",
                      onPressed: () {
                        SendPhoneNumber();
                      }),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  void SendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${seletedCountry.phoneCode}$phoneNumber ");
  }
}
