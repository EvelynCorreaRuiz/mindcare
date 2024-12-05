import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'night_reminder_screen.dart';
import 'dart:math';

class MorningReminderScreen extends StatefulWidget {
  const MorningReminderScreen({Key? key}) : super(key: key);

  @override
  State<MorningReminderScreen> createState() => _MorningReminderScreenState();
}

class _MorningReminderScreenState extends State<MorningReminderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);
  List<String> days = ["D", "L", "M", "M", "J", "V", "S"];
  List<bool> isSelected = [false, false, false, false, false, false, false];
  bool isAlarmEnabled = true;

  @override
  void initState() {
    super.initState();
    // Inicializa el controlador de animación
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(); // Hace que la animación se repita continuamente
  }

  @override
  void dispose() {
    // Libera los recursos del controlador cuando la pantalla se cierra
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateFormat('HH:mm')
        .format(DateTime(now.year, now.month, now.day, time.hour, time.minute));
  }

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
            // Animación del Sol
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * pi,
                  child: child,
                );
              },
              child: const Icon(
                Icons.wb_sunny,
                size: 80,
                color: Color(0xFFF89C31),
              ),
            ),
            const SizedBox(height: 10),
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
              "Te enviaremos un recordatorio\npor la mañana para ayudarte a lograr tu compromiso.",
              style: TextStyle(fontSize: 12, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Recordatorio interactivo
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF264653),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recordatorio de meditación",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (isAlarmEnabled) {
                            _selectTime(context);
                          }
                        },
                        child: Text(
                          formatTime(selectedTime),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isAlarmEnabled ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                      Switch(
                        value: isAlarmEnabled,
                        onChanged: (value) {
                          setState(() {
                            isAlarmEnabled = value;
                          });
                        },
                        activeColor: const Color(0xFFA791C4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Días de la semana
                  AbsorbPointer(
                    absorbing: !isAlarmEnabled,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(days.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            if (isAlarmEnabled) {
                              setState(() {
                                isSelected[index] = !isSelected[index];
                              });
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: isAlarmEnabled && isSelected[index]
                                  ? const Color(0xFF6BBFA3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isAlarmEnabled && isSelected[index]
                                    ? const Color(0xFF6BBFA3)
                                    : const Color(0xFF6BBFA3),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                days[index],
                                style: TextStyle(
                                  color: isAlarmEnabled && isSelected[index]
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 250),

            // Texto inferior
            const Text(
              "Las personas que meditan por las mañanas son más propensas a lograr establecer un hábito.",
              style: TextStyle(fontSize: 14, color: Color(0xFF6BBFA3)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),

            // Botón continuar
            ElevatedButton(
              onPressed: isAlarmEnabled && isSelected.contains(true)
                  ? () {
                // Acción del botón continuar
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const NightReminderScreen()),
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6BBFA3),
                disabledBackgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 50),
              ),
              child: const Text(
                "Guardar y Continuar",
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
