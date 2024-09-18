import 'package:calorie_care/helper.dart';
import 'package:flutter/material.dart';

import '../components/details_fields.dart';
import '../cubit/app_cubit/cubit.dart';
import '../custom_widgets/back_button.dart';
import '../custom_widgets/custom_button.dart';
import 'create_order_screen.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(con: context),
        centerTitle: true,
        title: Text(
          'Enter your details',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: MyFields(
                  ageController: ageController,
                  heightController: heightController,
                  weightController: weightController,
                ),
              ),
              const SizedBox(height: 12),
              CustomButton(
                text: 'Next',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AppCubit.get(context).calculateCalories(
                      weight: double.parse(weightController.text),
                      height: double.parse(heightController.text),
                      age: double.parse(ageController.text),
                    );
                    context.push(goTo: const CreateOrderScreen());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
- **For women**, calories = ((655.1) + (9.56 x [USER weight in KG]) + (1.85 x [USER height in cm]) - (4.67 x USER age in years]))
- **For men**, calories= ((666.47) + (13.75 x [USER weight in KG]) + (5 x [USER height in cm]) - (6.75 x [USER age in years]))
 */
