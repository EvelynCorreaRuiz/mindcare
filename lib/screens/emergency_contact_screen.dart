import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para inputFormatters
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class EmergencyContactScreen extends StatelessWidget {
  EmergencyContactScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _saveContact(String name, String phone) async {
    // Obtén la instancia de SharedPreferences
    final prefs = await SharedPreferences.getInstance();

    // Recupera los contactos existentes o un array vacío si no existen
    final contactsString = prefs.getString('emergency_contacts') ?? '[]';
    final contacts = List<Map<String, String>>.from(json.decode(contactsString));

    // Agrega el nuevo contacto
    contacts.add({'name': name, 'phone': phone});

    // Guarda los contactos actualizados
    await prefs.setString('emergency_contacts', json.encode(contacts));
  }

  void _handleSaveContact(BuildContext context) async {
    final String name = _nameController.text.trim();
    final String phone = _phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      // Muestra un mensaje de error si algún campo está vacío
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, completa todos los campos.")),
      );
      return;
    }

    // Guarda el contacto
    await _saveContact(name, phone);

    // Limpia los campos de texto
    _nameController.clear();
    _phoneController.clear();

    // Muestra un mensaje de confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Contacto guardado exitosamente.")),
    );

    // Regresa a la pantalla anterior
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              "assets/images/fondo_contacto.png", // Ruta de la imagen
              fit: BoxFit.cover,
            ),
          ),

          // Contenido principal
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Espaciado superior
                const SizedBox(height: 40),

                // Título
                const Text(
                  "Nuevo Contacto de Emergencia",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // Campo de texto para el nombre
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "Nombre",
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  ], // Acepta solo letras y espacios
                ),
                const SizedBox(height: 20),

                // Campo de texto para el número de celular
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: "Número Celular",
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                  ),
                  keyboardType: TextInputType.number, // Muestra teclado numérico
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ], // Acepta solo números
                ),
                const SizedBox(height: 30),

                // Botón Guardar
                ElevatedButton(
                  onPressed: () => _handleSaveContact(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF6587C4), // Color azul del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 50,
                    ),
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
                const Spacer(), // Empuja los widgets hacia arriba

                // Botón Volver
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Regresa a la pantalla anterior
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFF6BBFA3), // Verde del botón
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 50,
                      ),
                    ),
                    child: const Text(
                      "Volver Atrás",
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
