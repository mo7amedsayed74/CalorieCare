import 'package:calorie_care/features/book_doctor/presentation/views/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class OnlineView extends StatelessWidget {
  const OnlineView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const DoctorCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 22);
      },
    );
  }
}

