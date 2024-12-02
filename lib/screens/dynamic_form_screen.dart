import 'package:flutter/material.dart';
import 'package:mindcare/screens/commitment_screen.dart';

class DynamicFormScreen extends StatefulWidget {
  const DynamicFormScreen({Key? key}) : super(key: key);

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "¿Qué te gustaría lograr primero con MindCare?",
      "options": [
        "Aliviar estrés y ansiedad",
        "Dormir mejor",
        "Mejorar autoestima",
        "Aprender a meditar",
        "Probar algo nuevo"
      ]
    },
    {
      "question": "¿Qué hábitos te gustaría mejorar?",
      "options": [
        "Dormir a tiempo",
        "Comer más saludable",
        "Hacer ejercicio",
        "Controlar emociones",
        "Leer más"
      ]
    }
  ];

  int currentQuestionIndex = 0;
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF20445A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (currentQuestionIndex > 0) {
              // Si hay preguntas previas, retrocede
              setState(() {
                currentQuestionIndex--;
                selectedOptions.clear(); // Limpia las opciones seleccionadas
              });
            } else {
              // Si es la primera pregunta, regresa a la pantalla anterior
              Navigator.pop(context);
            }
          },
        ),
        title: Text(
          "Progreso ${(currentQuestionIndex + 1)} / ${questions.length}",
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF20445A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de progreso
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xFF6BBFA3),
            ),
            const SizedBox(height: 20),

            // Título de la pregunta
            Text(
              currentQuestion["question"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // Subtítulo
            const Text(
              "Buscaremos y crearemos un plan de bienestar pensado especialmente para ti.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30),

            // Opciones de respuesta
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion["options"].length,
                itemBuilder: (context, index) {
                  final option = currentQuestion["options"][index];
                  final isSelected = selectedOptions.contains(option);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedOptions.remove(option); // Deseleccionar
                        } else {
                          selectedOptions.add(option); // Seleccionar
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF2A9D8F)
                            : const Color(0xFF264653),
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Botón de continuar o finalizar
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Ajusta este valor para subir el botón
              child: Center(
                child: ElevatedButton(
                  onPressed: selectedOptions.isEmpty
                      ? null
                      : () {
                    if (currentQuestionIndex < questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                        selectedOptions.clear();
                      });
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const CommitmentScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A9D8F), // Color activo
                    disabledBackgroundColor: Colors.grey.shade500, // Color inactivo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bordes redondeados
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50), // Tamaño del botón
                  ),
                  child: Text(
                    currentQuestionIndex < questions.length - 1
                        ? "Continuar"
                        : "Finalizar",
                    style: const TextStyle(
                      fontSize: 20, // Tamaño del texto
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
