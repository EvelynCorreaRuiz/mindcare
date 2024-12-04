import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NightReminderScreen extends StatefulWidget {
  const NightReminderScreen({Key? key}) : super(key: key);

  @override
  State<NightReminderScreen> createState() => _NightReminderScreenState();
}

class _NightReminderScreenState extends State<NightReminderScreen> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 21, minute: 0);
  List<String> days = ["D", "L", "M", "M", "J", "V", "S"];
  List<bool> isSelected = [false, false, false, false, false, false, false];
  bool isAlarmEnabled = true;

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
    return DateFormat('HH:mm').format(DateTime(now.year, now.month, now.day, time.hour, time.minute));
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
            // Ícono y título
            const Icon(Icons.nightlight_round_outlined, size: 80, color: Color(0xFF6587C4)),
            const SizedBox(height: 10),
            const Text(
              "Prepárate para el descanso",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Te enviaremos un recordatorio\npor la noche para ayudarte a lograr tu compromiso.",
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
                                    : Color(0xFF6BBFA3),
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
              "Mejorar la calidad de sueño es uno de los pilares para promover tu salud mental",
              style: TextStyle(fontSize: 14, color: Color(0xFF6BBFA3)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),

            // Botón continuar
            ElevatedButton(
              onPressed: isAlarmEnabled && isSelected.contains(true)
                  ? () {
                // Acción del botón continuar
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6BBFA3),
                disabledBackgroundColor: Colors.grey,
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
