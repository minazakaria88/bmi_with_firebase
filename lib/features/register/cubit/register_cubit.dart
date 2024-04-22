import 'package:bmi_with_firebase/features/register/cubit/register_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/user_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitState());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void registerUser({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        createUser(
            email: email, uId: value.user!.uid, name: name, phone: phone);
        emit(RegisterSuccessState());
      },
    ).catchError((e) {
      emit(RegisterErrorState(error: e.toString()));
    });
  }

  void createUser({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) {
    UserModel model = UserModel(uId, email, name, phone);
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
      debugPrint('successfully');
    }).catchError((e){
      debugPrint(e.toString());
    });
  }
}
