import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learnbloc/model/post_model.dart';
import 'package:learnbloc/repository/post_repository.dart';
import 'package:learnbloc/utils/enums.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  List<PostModel> tempPostList = [];

  PostRepository postRepository = PostRepository();
  GetApiBloc() : super(const GetApiState()) {
    on<PostFetched>(fetchedPostApi);
    on<SearchItem>(filterList);
  }

  void filterList(SearchItem event, Emitter<GetApiState> emit) {
    if (event.searchText.isEmpty) {
      emit(state.copyWith(
        tempPostList: [],
        searchMessage: '',
      ));
    } else {
      tempPostList = state.postList
          .where((element) => element.email!.contains(event.searchText))
          .toList();
      if (tempPostList.isEmpty) {
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: 'No Data Found'));
      } else {
        emit(state.copyWith(tempPostList: tempPostList));
      }
    }
  }

  void fetchedPostApi(PostFetched postFecteched, Emitter<GetApiState> emit) async {
    await postRepository.fetchItem().then((value) {
      emit(
        state.copyWith(
          postStatus: PostStatus.success,
          postList: value,
          message: 'success',
        ),
      );
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }
}
