import 'package:flutter/material.dart';
import 'package:mindcare/screens/commitment_screen.dart';
import 'package:mindcare/screens/morning_reminder_screen.dart';

class CommitmentAcceptedScreen extends StatelessWidget {
  const CommitmentAcceptedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Redirige automáticamente a la siguiente pantalla después de unos segundos
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MorningReminderScreen()), // Sustituye NextScreen por la pantalla final
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF20445A),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF20445A),
      body: Center(
        child: const Text(
          "¡Compromiso\nAceptado!",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
