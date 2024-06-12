import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learnbloc/model/post_model.dart';
import 'package:learnbloc/repository/post_repository.dart';
import 'package:learnbloc/utils/enums.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  PostRepository postRepository = PostRepository();
  GetApiBloc() : super(const GetApiState()) {
    on<PostFetched>(fetchedPostApi);
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
