import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mindcare/screens/emergency_contact_screen.dart';
import 'reminder_screen.dart';
import 'emergency_contact_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  void _showEmotionalRefugeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Center(
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  color: const Color(0xFF6BBFA3),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Juanita y Pedro \nhan recibido nuestro mensaje\n para tu apoyo emocional",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ilustracion.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: PopupMenuButton<int>(
              icon: const Icon(
                Icons.settings,
                size: 50,
                color: Color(0xFFA791C4),
              ),
              offset: const Offset(-50, 60),
              color: Colors.transparent,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide.none,
              ),
              onSelected: (value) {
                if (value == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmergencyContactScreen()),
                  );
                } else if (value == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RemindersScreen()),
                  );
                } else if (value == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmergencyContactsListScreen()),
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmergencyContactScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(250, 40),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Nuevo Contacto Emergencia",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6587C4),
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RemindersScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(250, 40),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Recordatorios y Alarmas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6587C4),
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const EmergencyContactsListScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(250, 40),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Mis Contactos de Emergencia",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6587C4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 280,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "¡Hola, $userName!",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA791C4),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 25),
                  child: const Text(
                    "Recomendado para ti",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA791C4),
                    ),
                  ),
                ),
                const SizedBox(height: 1),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 0.9,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final List<String> buttonLabels = [
                        "Ejercicios de\nMindfulness",
                        "Ejercicios de\nRelajación",
                        "Recursos\nEducativos",
                        "Recordatorios\ny Alarmas",
                        "Meditación\nGuiada",
                        "Hábitos\nPositivos",
                      ];

                      return ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE4FAF6),
                          shape: const CircleBorder(),
                          elevation: 0,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: Text(
                          buttonLabels[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF6587C4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Gráfico de Progreso",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA791C4),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: const Text("Aquí va el gráfico de progreso"),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _showEmotionalRefugeDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6BBFA3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 50,
                      ),
                    ),
                    child: const Text(
                      "Refugio Emocional",
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
        ],
      ),
    );
  }
}
