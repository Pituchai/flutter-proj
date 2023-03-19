import 'package:flutter/material.dart';
import 'package:movie_app/constraints.dart';
import 'package:movie_app/screen/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (() {}),
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          padding: EdgeInsets.only(left: kDefaultPadding),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          )
        ]);
  }
}
