import 'package:flutter/material.dart';

class PhotoAndName extends StatelessWidget {
  const PhotoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: const Color(0xffED5500),
              width: 0.5,
            ),
          ),
          child: const Image(
            image: AssetImage(
              'assets/images/doctors/Ellipse 37.png',
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr.Ahmed Mohammed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              'Nutritionist',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff929292),
              ),
            ),
          ],
        )
      ],
    );
  }
}
