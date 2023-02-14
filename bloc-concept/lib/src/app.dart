import 'package:cmflutter0/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/pages/login/login_page.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// access the state , and we make this into the global
final navigatorState = GlobalKey<NavigatorState>() ; 

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // now we got one with the bloc
    final loginBloc = BlocProvider(create: (context) => LoginBloc()) ;

    return MultiBlocProvider(
      providers: [loginBloc],
      child: MaterialApp(
        title: "CMApp",

        routes: AppRoute.all,
        home: LoginPage(),
        navigatorKey: navigatorState ,
      )
    );
  }
}

