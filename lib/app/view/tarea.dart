import 'package:flutter/material.dart';

class TaskwidgedPage extends StatefulWidget {
  const TaskwidgedPage({super.key});

  @override
  State<TaskwidgedPage> createState() => _TaskwidgedState();
}

class _TaskwidgedState extends State<TaskwidgedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarea de Multiplataforma"),
        leading: GestureDetector(
          onTap:() {
              Navigator.of(context).pop();
          },
          child: const Center(child: Text('Atras')),
        ),
      ),
      body: const  Center(
        child: Text("Este es el segundo Widget mutable")
      ),
    );
  }
}