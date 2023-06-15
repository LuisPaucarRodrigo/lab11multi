import 'package:flutter/material.dart';

class BienvenidoPage extends StatelessWidget {
  const BienvenidoPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/instagram_logo.png'),
            width: 200,height: 200, fit: BoxFit.cover,),
            SizedBox(height: 24),
            Text(
              'Bienvenido a Instagram',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Conéctate con tus amigos y descubre\nnuevas experiencias.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        )
      ),
    );
  }
}