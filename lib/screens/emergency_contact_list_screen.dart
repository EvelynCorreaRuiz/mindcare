import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class EmergencyContactsListScreen extends StatefulWidget {
  const EmergencyContactsListScreen({Key? key}) : super(key: key);

  @override
  _EmergencyContactsListScreenState createState() =>
      _EmergencyContactsListScreenState();
}

class _EmergencyContactsListScreenState
    extends State<EmergencyContactsListScreen> {
  List<Map<String, String>> contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsString = prefs.getString('emergency_contacts') ?? '[]';
    setState(() {
      contacts = List<Map<String, String>>.from(
        json.decode(contactsString),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Stack(
        children: [
          // Fondo con ilustración
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
          // Título reposicionado
          Positioned(
            top: 250, // Ajusta este valor para colocarlo en la parte blanca
            left: 20,
            right: 20,
            child: const Text(
              "Mis Contactos de Emergencia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFA791C4),
              ),
            ),
          ),
          // Contenido
          Positioned(
            top: 280,
            left: 20,
            right: 20,
            bottom: 80, // Espacio para el botón de abajo
            child: contacts.isEmpty
                ? const Center(
              child: Text(
                "No hay contactos guardados.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            )
                : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        contact['phone'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Botón volver atrás
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6BBFA3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                minimumSize: const Size(80, 40), // Tamaño mínimo ajustado
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
    );
  }
}
