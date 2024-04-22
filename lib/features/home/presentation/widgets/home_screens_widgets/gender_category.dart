import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../cubit/app_cubit.dart';
import 'gender_item.dart';

class GenderCategory extends StatelessWidget {
  const GenderCategory({
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
            child: GenderItem(
              iconData: Icons.male,
              text: AppStrings.male,
              isSelected: cubit.isSelected,
              onPressed: (){
                cubit.upDateGender(true);
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: GenderItem(
              iconData: Icons.female,
              text: AppStrings.female,
              isSelected: cubit.isSelected? false:true,
              onPressed: (){
                cubit.upDateGender(false);
              },
            ),
          ),
        ],
      ),
    );
  }
}