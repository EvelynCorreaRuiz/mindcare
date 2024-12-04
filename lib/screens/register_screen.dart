import 'package:flutter/material.dart';
import 'dynamic_form_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título
              const Text(
                "Crea tu cuenta",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Completa los siguientes campos para empezar a usar MindCare.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Campo: Nombre o Apodo
              _buildInputField(
                labelText: "Nombre o Apodo",
                hintText: "Ingresa tu nombre o apodo",
                icon: Icons.person,
              ),

              const SizedBox(height: 20),

              // Campo: Edad
              _buildInputField(
                labelText: "Edad",
                hintText: "Ingresa tu edad",
                icon: Icons.calendar_today,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 20),

              // Campo: Email
              _buildInputField(
                labelText: "Email",
                hintText: "nombre@ejemplo.com",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // Campo: Contraseña
              _buildInputField(
                labelText: "Contraseña",
                hintText: "",
                icon: Icons.lock,
                isPassword: true,
              ),

              const SizedBox(height: 20),

              // Campo: Confirmar Contraseña
              _buildInputField(
                labelText: "Confirmar Contraseña",
                hintText: "",
                icon: Icons.lock,
                isPassword: true,
              ),

              const SizedBox(height: 30),

              // Botón: Registrarse
              ElevatedButton(
                onPressed: () {
                  // Aquí va la validación o autenticación del boton registrarse
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const DynamicFormScreen()),
                  );
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
                  "Registrarse",
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
      ),
    );
  }

  // Widget para los campos de entrada
  Widget _buildInputField({
    required String labelText,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white38),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white70, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xFF6BBFA3), width: 2.0),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
