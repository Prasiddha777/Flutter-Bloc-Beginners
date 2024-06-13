part of 'get_api_bloc.dart';

class GetApiState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;

  final String message;
  final String searchMessage;

  const GetApiState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  GetApiState copyWith(
      {PostStatus? postStatus,
      List<PostModel>? postList,
      String? message,
      String? searchMessage,
      List<PostModel>? tempPostList}) {
    return GetApiState(
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      tempPostList: tempPostList ?? this.tempPostList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props => [postStatus, postList, tempPostList, message, searchMessage];
}

final class GetApiInitial extends GetApiState {}
