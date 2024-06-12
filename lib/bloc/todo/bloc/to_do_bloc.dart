import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoState()) {
    on<ToDoEvent>((event, emit) {
      on(_addToDoEvent);
    });
  }

  void _addToDoEvent(AddToDoEvent event, Emitter<ToDoState> emit) {
    // emit(state.copyWith(todoList: event.task));
  }
}
