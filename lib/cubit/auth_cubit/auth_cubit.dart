import 'package:calorie_care/cubit/auth_cubit/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);


  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      //debugPrint(value.user!.phoneNumber);
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      debugPrint(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    debugPrint('hello');
    emit(RegisterLoadingState());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      //debugPrint(value.user!.email);
      //debugPrint(value.user!.uid);
      emit(RegisterSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

}
