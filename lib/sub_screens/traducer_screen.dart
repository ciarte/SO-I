import 'package:flutter/material.dart';
import '../screens/screens.dart';

class Interprete extends StatelessWidget {
  const Interprete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF172983),
        ),
        title: const Text(
          'Atrás',
          style: TextStyle(
            color: Color(0xFF172983),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                'Intérpretes Encontrados',
                style: TextStyle(
                    color: Color(0xFF172983),
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Expanded(
              child: ProfileList(),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color(0xFF3FB272)), // Color de fondo verde
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Bordes redondeados
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all<Size>(
                      const Size(double.infinity, 50)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyCall()),
                    // (context) => const CameraScreen()),
                  );
                },
                child: const Text(
                  'Empezar Videollamada',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
