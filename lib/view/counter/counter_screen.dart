import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/counter/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(state.counter.toString());
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
