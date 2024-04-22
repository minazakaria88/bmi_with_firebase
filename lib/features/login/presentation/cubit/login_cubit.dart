import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>
{
  LoginCubit():super(LoginInitState());

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();


  var formKey=GlobalKey<FormState>();

  void login({required String email,required String password})
  {
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(LoginSuccessState());
    }).catchError((e){
      emit(LoginErrorState(error: e.toString()));
    });
  }

}