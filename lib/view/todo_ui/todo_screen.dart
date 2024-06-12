import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/todo/bloc/to_do_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return const Text('No Data');
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.todosList[index]),
              );
            });
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ToDoBloc>().add(AddToDoEvent(task: 'New Task '));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
