import 'package:bmi_with_firebase/core/utils/app_strings.dart';
import 'package:bmi_with_firebase/core/utils/functios.dart';
import 'package:bmi_with_firebase/features/home/presentation/cubit/app_cubit.dart';
import 'package:bmi_with_firebase/features/home/presentation/cubit/app_state.dart';
import 'package:bmi_with_firebase/features/home/presentation/screens/bmi_result.dart';
import 'package:bmi_with_firebase/features/home/presentation/widgets/home_screens_widgets/bmi_calculate_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/home_screens_widgets/age_and_weight_category.dart';
import '../widgets/home_screens_widgets/gender_category.dart';
import '../widgets/home_screens_widgets/height_category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appBarTitle),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    AppStrings.gender,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GenderCategory(cubit: cubit),
                  const SizedBox(
                    height: 10,
                  ),
                  HeightCategory(
                      height: cubit.height,
                      function: (newHeight) {
                        cubit.upDateHeight(newHeight);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  AgeAndWeightCategory(cubit: cubit),
                  const SizedBox(
                    height: 20,
                  ),
                  BMICalculateButton(
                    onPressed: () {
                       cubit.calculateBmi();
                       goTo(context: context, screen: const BMIResult());
                    },
                    text: AppStrings.appBarTitle,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
