import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({Key? key}) : super(key: key);

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);
  final TextEditingController _titleController = TextEditingController();
  List<String> days = ["D", "L", "M", "M", "J", "V", "S"];
  List<bool> isSelected = [false, false, false, false, false, false, false];

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
        title: const Text(
          "Añadir Nuevo Recordatorio",
          style: TextStyle(
            color: Colors.white, // Título del AppBar en blanco
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF20445A),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Título del Recordatorio",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Título del campo en blanco
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              style: const TextStyle(
                color: Colors.white, // Texto del usuario en blanco
              ),
              decoration: InputDecoration(
                hintText: "Recordatorio de ...",
                hintStyle: const TextStyle(
                  color: Colors.white54, // Hint text en blanco semitransparente
                ),
                filled: true,
                fillColor: const Color(0xFF264653),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hora",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF264653),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  formatTime(selectedTime),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Días",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(days.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected[index] = !isSelected[index];
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isSelected[index]
                          ? const Color(0xFF6BBFA3)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF6BBFA3)),
                    ),
                    child: Center(
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: isSelected[index]
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
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aquí se agrega la lógica para guardar el recordatorio
                  final String title = _titleController.text;
                  if (title.isNotEmpty) {
                    Navigator.pop(context, {
                      "title": title,
                      "time": formatTime(selectedTime),
                      "days": isSelected,
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("El título no puede estar vacío"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6BBFA3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                child: const Text(
                  "Guardar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
