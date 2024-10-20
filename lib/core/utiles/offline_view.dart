import 'package:flutter/material.dart';

class OfflineView extends StatelessWidget {
  const OfflineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Color(0xFFF25700)),
          SizedBox(height: 32),
          Text(
            'Can\'t connect .. check internet!',
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
