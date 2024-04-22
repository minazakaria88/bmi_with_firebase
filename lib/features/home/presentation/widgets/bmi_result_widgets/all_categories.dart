import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../cubit/app_cubit.dart';
import 'cloumn_item.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(
                    cubit.isSelected ? Icons.male:Icons.female,
                    size: 30,
                    color: Colors.purple,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    AppStrings.gender,
                    style: TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              ColumnItem(value: cubit.age, text: AppStrings.age,),
              ColumnItem(value: cubit.height, text: AppStrings.height,),
              ColumnItem(value: cubit.weight, text: AppStrings.weight,),
            ],
          ),
        ),
      ),
    );
  }
}