import 'package:bmi_with_firebase/core/utils/app_strings.dart';
import 'package:bmi_with_firebase/core/utils/functios.dart';
import 'package:bmi_with_firebase/features/home/presentation/screens/home_screens.dart';
import 'package:bmi_with_firebase/features/home/presentation/widgets/home_screens_widgets/bmi_calculate_button.dart';
import 'package:bmi_with_firebase/features/login/presentation/cubit/login_cubit.dart';
import 'package:bmi_with_firebase/features/login/presentation/cubit/login_state.dart';
import 'package:bmi_with_firebase/features/login/presentation/widgets/new_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit,LoginState>(
        builder: (context, state) {
          var cubit=BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.login),
            ),
            body: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NewTextFormFiled(
                        controller: cubit.email,
                        obscure: false,
                        label: 'email',
                        iconData: Icons.person
                    ),
                    NewTextFormFiled(
                        controller: cubit.password,
                        obscure: false,
                        label: 'password',
                        iconData: Icons.password
                    ),
                    BMICalculateButton(
                        onPressed: (){
                          if(cubit.formKey.currentState!.validate())
                            {
                              goTo(context: context, screen: const HomeScreen());
                            }
                        },
                        text: 'login',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
