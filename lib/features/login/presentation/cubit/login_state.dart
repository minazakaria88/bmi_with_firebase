abstract class LoginState{}
class LoginInitState extends LoginState{}
class LoginSuccessState extends LoginState{}

class LoginLoadingState extends LoginState{}

class LoginErrorState extends LoginState{
  final String error;
  LoginErrorState({required this.error});
}