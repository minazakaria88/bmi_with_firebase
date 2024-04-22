import 'package:flutter/material.dart';

import '../../cubit/app_cubit.dart';

class StatusAndRageItem extends StatelessWidget {
  const StatusAndRageItem({
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
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: RichText(
            text: TextSpan(
              style:const TextStyle(
                  height: 2
              ),
              children: [
                const TextSpan(
                    text: 'A BMI of  ',
                    style: TextStyle(color: Colors.black,fontSize: 18)
                ),
                TextSpan(
                    text: cubit.resultModel.range,
                    style: const TextStyle(color: Colors.blue,fontSize: 18)
                ),
                const TextSpan(
                  text: ' indicates that your weight is in the ',
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
                TextSpan(
                    text: cubit.resultModel.status,
                    style: const TextStyle(color: Colors.blue,fontSize: 18)
                ),
                const TextSpan(
                  text: ' for person in your height',
                  style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ],
            ),

          )
      ),
    );
  }
}