import 'package:bmi_with_firebase/core/utils/app_strings.dart';
import 'package:bmi_with_firebase/features/home/presentation/cubit/app_cubit.dart';
import 'package:bmi_with_firebase/features/home/presentation/cubit/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bmi_result_widgets/all_categories.dart';
import '../widgets/bmi_result_widgets/container_of_result.dart';
import '../widgets/bmi_result_widgets/status_and_range_item.dart';

class BMIResult extends StatelessWidget {
  const BMIResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appBarResultTitle),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    AppStrings.result,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                const Center(
                  child: Text(
                    AppStrings.yourBMI,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ContainerOfResult(cubit: cubit),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    '(${cubit.resultModel.status})',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AllCategories(cubit: cubit),
                const SizedBox(
                  height: 20,
                ),
                StatusAndRageItem(cubit: cubit),
              ],
            ),
          ),
        );
      },
    );
  }
}




