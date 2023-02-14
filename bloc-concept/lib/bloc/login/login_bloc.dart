import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cmflutter0/src/app.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../src/models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

//this is concern on business logic
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEventAdd>((event, emit) async {
      // TODO: implement event handler
      /* 1.) execute something here       
         2.) can't change state directly, need to clone the object only   
      */
      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(count: state.count + 1));
    });

    on<LoginEventRemove>((event, emit) {
      /* 1.) execute something here
         2.) can't change state directly, need to clone the object only   
      */
      emit(state.copyWith(count: state.count - 1));
    });

    // Login
    on<LoginEventLogin>((event, emit) {
      if (event.payload.username == "Admin" &&
          event.payload.password == "1234") {
        emit(state.copyWith(isAuthened: true));
        if (navigatorState.currentContext != null) {
          Navigator.pushReplacementNamed(
              navigatorState.currentContext!, AppRoute.home).then((value) => null);
        }
      } else {
        emit(state.copyWith(isAuthened: false));
      }
    });
  }

  //   static  LoginInitial() {}
}
