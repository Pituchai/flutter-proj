part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  //in the term of mvvm, can not interfere the variable(use final)
  final int count;
  final bool isAuthened;

  //Force to make count come to here
  const LoginState({this.count = 0, this.isAuthened = false});

  //return back the object to where it came
  // int?  =  optional,have or haven't both are ok
  LoginState copyWith({int? count, bool? isAuthened}) {
    return LoginState(
      count: count ?? this.count,
      isAuthened: isAuthened ?? this.isAuthened,
    );
  }

  @override
  // TODO: implement props
  // จดจำค่า
  //  if not abstract have to do this,Sharing the variable but don't need the UI changing
  List<Object?> get props => [count,isAuthened];
}
