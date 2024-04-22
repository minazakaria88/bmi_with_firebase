import 'package:bmi_with_firebase/features/home/presentation/widgets/home_screens_widgets/weight_category.dart';
import 'package:flutter/material.dart';

import '../../cubit/app_cubit.dart';
import 'age_category.dart';

class AgeAndWeightCategory extends StatelessWidget {
  const AgeAndWeightCategory({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: AgeCategory(
              age: cubit.age,
              functionADD: (){
                cubit.upDateAgePlus();
              },
              functionMIN: (){
                cubit.upDateAgeMin();
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: WeightCategory(
              weight: cubit.weight,
              function: (newWeight){
                cubit.upDateWeight(newWeight);
              },
            ),
          ),
        ],
      ),
    );
  }
}