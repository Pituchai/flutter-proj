import 'package:cmflutter0/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

void main() {
  runApp(const CMApp());
}

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CMApp",
      home: LoginPage(),
    );
  }
}

// if want to create the variable need to create in here  Stateful
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = "Admin";
    _passwordController.text = "1234";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text("LoginPage  ${state.count}");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity, // full width
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                child: Container( 
                  padding: const EdgeInsets.all(32),
                  height: 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      ..._buildTextField(),
                      const SizedBox(
                        height: 32,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return 
                          // the following is the true and the last is false
                          Text("Login Result ${state.isAuthened ? " Success":"Error"}", 
                          style: TextStyle(color: state.isAuthened ? Colors.green : Colors.red) ,
                          
                          );
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ..._buildButtons(),
                      Row(
                        children: [
                          /* 
                          from wrap with bloc builder
                          */
                          BlocBuilder<LoginBloc, LoginState>(
                            // return the state
                            builder: (context, state) {
                              //need to have {} when you using the .
                              return Text("DebugX: ${state.count} ");
                            },
                          ),
      
                          //sepertion of concern
                          IconButton(
                            //context =  store the variable state
                            onPressed: () =>
                                context.read<LoginBloc>().add(LoginEventAdd()),
                            icon: Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () =>
                                context.read<LoginBloc>().add(LoginEventRemove()),
                            icon: Icon(Icons.remove),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
            // child: Column(
            // cross = แนวนอน
            // main  = แนวตั้ง
            //  CrossAxisAlignment.stretch is for การยืดให้เต็ม
            //     Text("Login Form"),
            // ),
            ),
      ),
    );
  }

  void _handleClickLogin() {
    final user = User(
      username: _usernameController.text,
      password: _passwordController.text,
    );
    context.read<LoginBloc>().add(LoginEventLogin(user));
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  _buildTextField() {
    return [
      TextField(
        // let the _user controll this text filed
        controller: _usernameController,
        decoration: const InputDecoration(labelText: "UserName"),
      ),
      TextField(
        // let the _user controll this text filed
        controller: _passwordController,
        decoration: const InputDecoration(labelText: "Password"),
      ),
    ];
  }

  _buildButtons() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: Text("SignIn"),
      ),
      OutlinedButton(
        onPressed: _handleClickRegister,
        child: Text("Register"),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: Text("Reset"),
      )
    ];
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }
  //State(MVVM style)
  //need to run this finish first and then update the UI
  //Look at this to be like the function
  //more effective when have a little code

}
