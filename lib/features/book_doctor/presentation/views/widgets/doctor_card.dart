import 'package:calorie_care/features/book_doctor/presentation/views/widgets/book_button.dart';
import 'package:calorie_care/features/book_doctor/presentation/views/widgets/photo_and_name.dart';
import 'package:calorie_care/features/book_doctor/presentation/views/widgets/row_info.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffAFAFAF),
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Column(
            children: [
              const PhotoAndName(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const RowInfo(txt: 'Type : Follow-ups nutrition'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const RowInfo(txt: 'Audio and Video sessions'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const RowInfo(txt: 'Arabic , English'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const RowInfo(txt: '7 years of experience'),
              const Divider(
                indent: 5,
                endIndent: 5,
              ),
              const RowInfo(
                txt: 'Earliest availability',
                secondTxt: '20/10 - 7:00 pm',
              ),
              const Divider(
                indent: 5,
                endIndent: 5,
              ),
              const RowInfo(
                txt: 'Price',
                secondTxt: '300 EGP / 30 minute',
              ),
              const SizedBox(height: 8),
              const BookButton(),
            ],
          ),
        ),
      ),
    );
  }
}
