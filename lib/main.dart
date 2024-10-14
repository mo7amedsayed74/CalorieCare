import 'package:calorie_care/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:calorie_care/features/auth/presentation/views/login_page.dart';
import 'package:calorie_care/features/food_order/presentation/manger/app_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/utiles/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFFF25700),
          scaffoldBackgroundColor: Colors.grey[100],
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFFFFFF)),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
