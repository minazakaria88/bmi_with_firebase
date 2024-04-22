import 'package:bmi_with_firebase/features/login/presentation/screens/login_screen.dart';
import 'package:bmi_with_firebase/features/register/cubit/register_cubit.dart';
import 'package:bmi_with_firebase/features/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/functios.dart';
import '../../../home/presentation/widgets/home_screens_widgets/bmi_calculate_button.dart';
import '../../../login/presentation/widgets/new_text_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit,RegisterState>(
        builder: (context, state) {
          var cubit=BlocProvider.of<RegisterCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('register'),
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
                        iconData: Icons.email
                    ),
                    NewTextFormFiled(
                        controller: cubit.password,
                        obscure: false,
                        label: 'password',
                        iconData: Icons.password
                    ),
                    NewTextFormFiled(
                        controller: cubit.name,
                        obscure: false,
                        label: 'name',
                        iconData: Icons.person
                    ),
                    NewTextFormFiled(
                        controller: cubit.phone,
                        obscure: false,
                        label: 'phone',
                        iconData: Icons.phone
                    ),
                    BMICalculateButton(
                      onPressed: (){
                        if(cubit.formKey.currentState!.validate())
                        {
                          goTo(context: context, screen: const LoginScreen());
                        }
                      },
                      text: 'register',
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