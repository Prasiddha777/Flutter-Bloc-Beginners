import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/counter/bloc/counter_bloc.dart';
import 'package:learnbloc/bloc/get_api/bloc/get_api_bloc.dart';
import 'package:learnbloc/bloc/todo/bloc/to_do_bloc.dart';
import 'package:learnbloc/view/api/get_api_screen.dart';
import 'package:learnbloc/view/counter/counter_screen.dart';
import 'package:learnbloc/view/todo_ui/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ToDoBloc()),
        BlocProvider(create: (context) => GetApiBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const GetApiScreen(),
        home: const CounterScreen(),
      ),
    );
  }
}
