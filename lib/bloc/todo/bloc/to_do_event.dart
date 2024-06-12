part of 'to_do_bloc.dart';

abstract class ToDoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToDoEvent extends ToDoEvent {
  final String task;
  AddToDoEvent({required this.task});
  @override
  List<Object> get props => [];
}

class RemoveToDoEvent extends ToDoEvent {
  @override
  List<Object> get props => [];
}
