part of 'login_bloc.dart';
//action
abstract class LoginEvent extends Equatable {
    @override
  // TODO: implement props
  // track to check do any changes happen or not
  List<Object?> get props => [] ;
}

class LoginEventAdd extends LoginEvent {

}


class LoginEventRemove  extends LoginEvent {
  
}
// event that has a payload 
class LoginEventLogin extends LoginEvent {
  final User payload ;
  LoginEventLogin(this.payload); 
}
