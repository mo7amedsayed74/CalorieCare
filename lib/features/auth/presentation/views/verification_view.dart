import 'package:calorie_care/core/utiles/functions/snackbar.dart';
import 'package:calorie_care/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:calorie_care/features/auth/presentation/view_model/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is VerificationSuccessState) {
          Navigator.pop(context); // VerificationView
          Navigator.pop(context); // RegisterScreen
        } else if (state is VerificationFailureState) {
          showMySnackBar(
            context: context,
            msg: 'Verification Failure',
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Verify Email')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Please check your email for the verification link.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 60),
            TextButton(
              onPressed: () {
                AuthCubit.get(context).checkEmailVerified();
              },
              child: const Text(
                'Done!',
                style: TextStyle(color: Colors.green),
              ),
            ),
            const Spacer(),
            const Text(
              'Didn\'t receive an email?',
              style: TextStyle(color: Colors.grey),
            ),
            TextButton(
              onPressed: () {
                AuthCubit.get(context).resendVerificationEmail(context);
              },
              child: const Text(
                'Resend Verification Email',
                style: TextStyle(color: Color(0xFFF25700)),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
