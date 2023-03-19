import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../provider/auth_provider.dart';
import '../utils/utils.dart';
import '../widgets/custom_buttom.dart';
import 'home_screen.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
          child: Column(
            children: [
              InkWell(
                onTap: () => selectImage(),
                child: image == null
                    // if they don't have got the picture in data
                    ? const CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 50,
                        child: Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.white,
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(image!),
                        radius: 50,
                      ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    //name
                    textField(
                        hintText: "Fam Pituchai",
                        icon: Icons.account_circle,
                        inputType: TextInputType.name,
                        maxLines: 1,
                        controller: nameController),
                    //email
                    textField(
                        hintText: "abc@hotmail.com",
                        icon: Icons.email,
                        inputType: TextInputType.emailAddress,
                        maxLines: 1,
                        controller: emailController),
                    //bio
                    textField(
                        hintText: "Write your bio here",
                        icon: Icons.edit,
                        inputType: TextInputType.text,
                        maxLines: 2,
                        controller: bioController),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: CustomButton(
                        text: "Continue",
                        onPressed: () => storeData(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget textField(
      {required String hintText,
      required IconData icon,
      required TextInputType inputType,
      required int maxLines,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.purple,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.purple),
            child: Icon(icon, size: 20, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.purple.shade50,
          filled: true,
        ),
      ),
    );
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      bio: bioController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
      uid: "",
    );
      if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false),
                    ),
              );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }
  

}