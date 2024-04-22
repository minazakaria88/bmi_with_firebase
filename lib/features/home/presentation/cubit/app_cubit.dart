import 'package:bmi_with_firebase/features/home/data/models/result_model.dart';
import 'package:bmi_with_firebase/features/home/presentation/cubit/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit():super(InitState());

  int height=150;

  void upDateHeight(int newHeight)
  {
    height=newHeight;
    emit(UpDateHeight());
  }

  int age=20;

  void upDateAgePlus()
  {
    age++;
    emit(UpDateAge());
  }

  void upDateAgeMin()
  {
    if(age!=0)
      {
        age--;
        emit(UpDateAge());
      }
  }


  int weight=80;

  void upDateWeight(int newWeight)
  {
    weight=newWeight;
    emit(UpDateWeight());
  }

    bool  isSelected=true;

  void upDateGender(bool f)
  {
    isSelected=f;
    emit(UpDateGender());
  }

  late ResultModel resultModel;
  void calculateBmi()
  {
     double result=weight/((height/100)*(height/100));
     resultModel=ResultModel(result: result);
     resultModel.assignStatus();
     debugPrint(resultModel.status);
     emit(CalculateBMi());
  }

}