import 'package:calorie_care/helper.dart';
import 'package:calorie_care/screens/doctors_screen.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_button.dart';
import 'details_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cover.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  'Balanced Meal',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Text(
                'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'order food',
                onPressed: () => context.push(goTo: DetailsScreen()),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Book with a doctor',
                onPressed: () => context.push(goTo: DoctorsScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
