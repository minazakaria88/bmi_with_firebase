abstract class RegisterState
{}
class RegisterInitState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}

class RegisterSuccessState extends RegisterState{}

class RegisterErrorState extends RegisterState{
  final String  error;
  RegisterErrorState({required this.error});
}
