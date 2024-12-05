import 'package:flutter/material.dart';
import 'add_reminder_screen.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF20445A),
        title: const Text(
          "Recordatorios y Alarmas",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF20445A), // Fondo azul oscuro
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildReminderCard(
                  context,
                  "Recordatorio de Meditación",
                  "08:00",
                  Icons.wb_sunny,
                  isEnabled: true,
                ),
                const SizedBox(height: 15),
                _buildReminderCard(
                  context,
                  "Recordatorio de Meditación",
                  "21:30",
                  Icons.nightlight_round,
                  isEnabled: false,
                ),
                const SizedBox(height: 15),
                _buildReminderCard(
                  context,
                  "Recordatorio de Medicamentos",
                  "21:30",
                  Icons.medical_services,
                  isEnabled: true,
                ),
                const SizedBox(height: 15),
                _buildReminderCard(
                  context,
                  "Recordatorio de Sueño",
                  "22:30",
                  Icons.bedtime,
                  isEnabled: true,
                ),
              ],
            ),
          ),

          // Botón para añadir nuevo recordatorio
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddReminderScreen()),
                );
                if (result != null) {
                  // Procesa los datos del nuevo recordatorio
                  print(result);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6BBFA3), // Color verde
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
              ),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                "Añadir Recordatorio",
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
    );
  }

  // Widget para las tarjetas de recordatorio
  Widget _buildReminderCard(
      BuildContext context,
      String title,
      String time,
      IconData icon, {
        required bool isEnabled,
      }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF264653), // Fondo más oscuro
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título e ícono
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                icon,
                size: 24,
                color: isEnabled ? Colors.yellow : Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Hora y días de la semana
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Switch(
                value: isEnabled,
                onChanged: (value) {
                  // Acción al activar/desactivar
                },
                activeColor: const Color(0xFF6BBFA3),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Días de la semana
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["D", "L", "M", "M", "J", "V", "S"]
                .map(
                  (day) => Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isEnabled ? const Color(0xFF6BBFA3) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF6BBFA3),
                  ),
                ),
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      color: isEnabled ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}
