import 'package:flutter/material.dart';
import 'screens/start_home_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;



void main() {
  tz.initializeTimeZones(); //inicializa las zonas horarias
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Parkinsans',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16), // Texto principañ
          bodyMedium: TextStyle(fontSize: 14), // Texto secundario
          headlineLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),// Encabezados
          titleMedium: TextStyle(fontSize: 20), //Subtítulos
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF20445A), //Fondo de la app
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartHomeScreen()),
      );
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF744FA4), Color(0xFF60B392)], // Degradado morado-azul
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png', // Ruta al logo
                height: 203,
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

