part of 'get_api_bloc.dart';

sealed class GetApiEvent extends Equatable {
  const GetApiEvent();

  @override
  List<Object> get props => [];
}

class PostFetched extends GetApiEvent {}
