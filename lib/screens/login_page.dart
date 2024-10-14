import 'package:calorie_care/cubit/auth_cubit/auth_cubit.dart';
import 'package:calorie_care/screens/register_page.dart';
import 'package:calorie_care/screens/welcome_screen.dart';
import 'package:calorie_care/widgets/login_button.dart';
import 'package:calorie_care/widgets/login_image.dart';
import 'package:calorie_care/widgets/login_link.dart';
import 'package:calorie_care/widgets/login_text_field.dart';
import 'package:calorie_care/widgets/login_title.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateEmail);
    _passwordController.addListener(_validatePassword);
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateEmail() {
    final value = _emailController.text;
    if (value.isEmpty) {
      setState(() {
        _emailError = 'Please enter your email';
      });
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      setState(() {
        _emailError = 'Please enter a valid email address';
      });
    } else {
      setState(() {
        _emailError = null;
      });
    }
  }

  void _validatePassword() {
    final value = _passwordController.text;
    if (value.isEmpty) {
      setState(() {
        _passwordError = 'Please enter your password';
      });
    } else if (value.length < 6) {
      setState(() {
        _passwordError = 'Password must greater than 6 chars';
      });
    } else {
      setState(() {
        _passwordError = null;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEBDA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginImage(topPadding: 50),
                const SizedBox(height: 10),
                const LoginTitle(title: 'LOGIN'),
                const SizedBox(height: 20),
                LoginTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  errorText: _emailError,
                ),
                const SizedBox(height: 20),
                LoginTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: _obscureText,
                  suffixIcon:
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                  onSuffixIconPressed: _togglePasswordVisibility,
                  errorText: _passwordError,
                ),
                const SizedBox(height: 20),
                LoginButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                LoginLink(
                  text: 'Don\'t have an account? Register',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
