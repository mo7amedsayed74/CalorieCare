import 'package:flutter/material.dart';

class RowInfo extends StatelessWidget {
  const RowInfo({super.key, required this.txt, this.secondTxt});

  final String txt;
  final String? secondTxt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xffED5500),
          size: 25,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Text(
          txt,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        if (secondTxt != null) ...[
          const Spacer(),
          Text(
            secondTxt!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ]
      ],
    );
  }
}
