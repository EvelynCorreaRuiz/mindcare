import 'package:flutter/material.dart';
import '/widgets/day_circle.dart';
import 'night_reminder_screen.dart';

class MorningReminderScreen extends StatelessWidget {
  const MorningReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF20445A),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF20445A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícono y título
            const Icon(Icons.wb_sunny, size: 80, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              "Comienza el día meditando",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Te enviaremos un recordatorio por la mañana\npara ayudarte a lograr tu compromiso.",
              style: TextStyle(fontSize: 16, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Recordatorio y switches
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF264653),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // Hora del recordatorio
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "08:00",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Switch(
                        value: true,
                        onChanged: null,
                        activeColor: Color(0xFF6BBFA3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Días de la semana
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DayCircle(day: "D", isActive: true),
                      DayCircle(day: "L", isActive: true),
                      DayCircle(day: "M", isActive: true),
                      DayCircle(day: "M", isActive: true),
                      DayCircle(day: "J", isActive: true),
                      DayCircle(day: "V", isActive: true),
                      DayCircle(day: "S", isActive: false),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Texto inferior
            const Text(
              "Las personas que madrugan por las mañanas son más propensas a lograr establecer un hábito.",
              style: TextStyle(fontSize: 14, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Botón continuar
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NightReminderScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6BBFA3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              ),
              child: const Text(
                "Continuar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
