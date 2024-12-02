import 'package:flutter/material.dart';

class DayCircle extends StatelessWidget {
  final String day;
  final bool isActive;

  const DayCircle({required this.day, required this.isActive, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6BBFA3) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? const Color(0xFF6BBFA3) : Colors.white70,
        ),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
