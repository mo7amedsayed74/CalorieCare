import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showAlert(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF25700),
        fixedSize: const Size(150, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        'Book Now!',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: AlertDialog(
            title: Center(
              child: Text(
                'Success Reservation!',
                style: TextStyle(color: Colors.green[800], fontSize: 22),
              ),
            ),
            content: const Text(
              'The appointment has been reserved for you.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xffED5500), fontSize: 18),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                child: const Text(
                  'OK',
                  style: TextStyle(color: Color(0xffED5500), fontSize: 14),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Closes the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
