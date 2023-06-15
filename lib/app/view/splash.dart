import 'package:flutter/material.dart';
import 'package:laboratorio02/app/view/tarea.dart';
import 'package:laboratorio02/app/view/task_list.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: 
                (context) {
                  return const TaskwidgedPage();
                }));
              },
                child: Image.asset(
                'assets/images/Vector.png',
                width: 141,
                height: 129,
              ),
              )
            ],
          ),
          const SizedBox(height: 79),
          Image.asset(
            'assets/images/onboarding-image.png',
            width: 180,
            height: 168,
          ),
          const SizedBox(height: 99),
          Text('Lista de tareas', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600
          )),
          const SizedBox(height: 21),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32)),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: 
                (context) {
                  return const TaskListPage();
                }));
              },
              child: const Text(
                'La mejor forma para que no se te olvide nada es anotarlo. Guarda tus tareas y ve completando tu productividad',
                textAlign: TextAlign.center,
              )
            )
        ],
      ),
    );
  }
}