import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:mindcare/screens/morning_reminder_screen.dart';

class CommitmentAcceptedScreen extends StatefulWidget {
  const CommitmentAcceptedScreen({Key? key}) : super(key: key);

  @override
  _CommitmentAcceptedScreenState createState() => _CommitmentAcceptedScreenState();
}

class _CommitmentAcceptedScreenState extends State<CommitmentAcceptedScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play(); // Inicia la animación al cargar la pantalla
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Redirige automáticamente a la siguiente pantalla después de unos segundos
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MorningReminderScreen()),
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF20445A),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF20445A),
      body: Stack(
        children: [
          // Texto de compromiso aceptado
          Center(
            child: const Text(
              "¡Compromiso\nAceptado!",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Animación de confeti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive, // Explosión en todas direcciones
              shouldLoop: true, // No repetir
              emissionFrequency: 0.005, // Frecuencia de emisión
              numberOfParticles: 150, // Cantidad de partículas
              gravity: 0.09, // Gravedad del confeti
              colors: const [
                Colors.pinkAccent,
                Colors.blue,
                Colors.yellow,
                Colors.green,
                Colors.purple,
              ], // Colores del confeti
            ),
          ),
        ],
      ),
    );
  }
}
