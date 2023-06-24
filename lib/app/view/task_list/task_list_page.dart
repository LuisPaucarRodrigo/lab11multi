import 'package:flutter/material.dart';
import 'package:laboratorio02/app/model/task.dart';
import 'package:laboratorio02/app/view/components/h1.dart';
import 'package:laboratorio02/app/view/components/shape.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final taskList = <Task>[
  Task("Tarea1"),
  Task("Tarea2"),
  Task("Tarea3")
  ];
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Center(child: Text('Atrás')),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const Row(children: [Shape()]),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/tasks-list-image.png',
                      width: 120,
                      height: 120
                    ),
                    const SizedBox(height: 16),
                    const H1('Completa tus tareas', color: Colors.white),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30,right: 30,top: 35),
            child: H1('Tareas'),
          ),
          Expanded(
            child: Padding (
              padding : const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
              itemCount: taskList.length,
              itemBuilder: (_, index) => _TaskItem(
                taskList[index],
                onTap:() {
                  taskList[index].done = !taskList[index].done;
                  setState((){

                  });
                },
                onDelete: () {
                  setState(() {
                    taskList.removeAt(index); // Elimina la tarea de la lista
                  });
                },
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
            )  
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Ingrese una tarea',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: taskController,
                          decoration: const InputDecoration(
                            hintText: 'Ingrese una nueva Tarea',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            String taskName = taskController.text;
                            if (taskName.isNotEmpty) {
                              Task newTask = Task(taskName);
                              setState(() {
                                taskList.add(newTask);
                              });
                              taskController.clear();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Agregar tarea'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },

        child: const Icon(Icons.add, size: 50),
      ),
    ); 
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task,{this.onTap,this.onDelete});

  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar tarea'),
          content: const Text('¿Estás seguro de que deseas eliminar esta tarea?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                onDelete!(); // Elimina la tarea
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: () => _showDeleteConfirmationDialog(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                task.done
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}