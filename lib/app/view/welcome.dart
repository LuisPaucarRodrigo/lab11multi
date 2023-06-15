import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/flutter.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 32),
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Gracias por usar nuestra aplicación',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
