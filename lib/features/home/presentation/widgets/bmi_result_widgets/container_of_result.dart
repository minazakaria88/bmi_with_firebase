import 'package:flutter/material.dart';

import '../../cubit/app_cubit.dart';

class ContainerOfResult extends StatelessWidget {
  const ContainerOfResult({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                '${cubit.resultModel.result.roundToDouble()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'kg/m2 ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}