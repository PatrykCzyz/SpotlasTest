import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';
import 'package:spotlas_test/infrastructure/feed/feed_repository.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository _feedRepository;

  FeedBloc(this._feedRepository) : super(FeedInitial()) {
    on<FetchData>((event, emit) async {
      emit(FeedLoading());

      final recommendations = await _feedRepository.getFeed(1);

      emit(FeedLoaded(
        recommendations: recommendations,
        currentPage: 1,
      ));
    });

    on<FetchNextPage>((event, emit) async {
      if (state is FeedLoaded && !(state as FeedLoaded).isLoadingNextPage) {
        final stateLoaded = state as FeedLoaded;
        final nextPage = stateLoaded.currentPage + 1;

        emit(
          stateLoaded.copyWith(
            isLoadingNextPage: true,
          ),
        );

        final nextRecommendations = await _feedRepository.getFeed(nextPage);
        final recommendations = stateLoaded.recommendations;
        recommendations.addAll(nextRecommendations);

        emit(
          stateLoaded.copyWith(
            isLoadingNextPage: false,
            currentPage: nextPage,
            recommendations: recommendations,
          ),
        );
      }
    });

    on<ToggleBookmark>((event, emit) {
      if (state is FeedLoaded) {
        final stateLoaded = state as FeedLoaded;

        final newRecommendation =
            event.recommendation.copyWith(isBookmarked: !event.recommendation.isBookmarked);

        final index = stateLoaded.recommendations.indexOf(event.recommendation);

        stateLoaded.recommendations[index] = newRecommendation;

        emit(
          stateLoaded.copyWith(
            recommendations: stateLoaded.recommendations,
          ),
        );
      }
    });

    on<ToggleLike>((event, emit) {
      if (state is FeedLoaded) {
        final stateLoaded = state as FeedLoaded;

        final newRecommendation =
            event.recommendation.copyWith(isLiked: !event.recommendation.isLiked);

        final index = stateLoaded.recommendations.indexOf(event.recommendation);

        stateLoaded.recommendations[index] = newRecommendation;

        emit(
          stateLoaded.copyWith(
            recommendations: stateLoaded.recommendations,
          ),
        );
      }
    });
  }
}
