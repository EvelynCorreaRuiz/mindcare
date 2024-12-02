import 'package:flutter/material.dart';
import 'package:mindcare/screens/dynamic_form_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fondologin.jpg'), // Ruta al fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Título
                    const Text(
                      "Inicio de Sesión",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Campo de correo electrónico
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "nombre@ejemplo.com",
                        labelText: "Correo Electrónico",
                        labelStyle: const TextStyle(color: Colors.white70, fontSize: 20),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white70, width: 1.5), //Borde cuando está INACTIVO
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Color(0xFF744FA4), width: 2.0) //Borde cuando está ACTIVO
                        ),
                      ),
                      style: const TextStyle(color: Colors.white), //Estilo del texto ingresado
                    ),
                    const SizedBox(height: 20),

                    // Campo de contraseña
                    TextFormField(
                      obscureText: true, //Oculta los caracteres
                      decoration: InputDecoration(
                        hintText: "**********",
                        labelText: "Contraseña",
                        labelStyle: const TextStyle(color: Colors.white70, fontSize: 20),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white70, width: 1.5), //Borde INACTIVO
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Color(0xFF744FA4), width: 2.0), //Borde ACTIVO
                        ),
                      ),
                      style: const TextStyle(color: Colors.white), //Estilo del texto ingresado
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "O bien, inicia sesión con:",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15),

                    // Botones de redes sociales
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo de Google
                        GestureDetector(
                          onTap: () {
                            // Acción al presionar el botón de Google
                          },
                          child: Container(
                            width: 90, // Tamaño del contenedor
                            height: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle, // Forma circular
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0), // Espacio interno
                              child: Image.asset(
                                'assets/images/logo_google.png', // Ruta del logo de Google
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 75), // Espacio entre los logos

                        // Logo de Facebook
                        GestureDetector(
                          onTap: () {
                            // Acción al presionar el botón de Facebook
                          },
                          child: Container(
                            width: 90, // Tamaño del contenedor
                            height: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle, // Forma circular
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0), // Espacio interno
                              child: Image.asset(
                                'assets/images/logo_face.png', // Ruta del logo de Facebook
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 20),

                    // Botón de "Iniciar Sesión"
                    ElevatedButton(
                      onPressed: () {
                        // Aquí va la validación o autenticación del inicio de sesión
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const DynamicFormScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF264653), // Color personalizado
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      ),
                      child: const Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
