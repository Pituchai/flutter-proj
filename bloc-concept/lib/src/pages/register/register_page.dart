import 'package:cmflutter0/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Text('Register Page : ${state.count}');
        },
      )),
      body: Container(),
    );
  }
}
