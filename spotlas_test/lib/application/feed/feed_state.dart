part of 'feed_bloc.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<Recommendation> recommendations;
  final int currentPage;
  final bool isLoadingNextPage;

  FeedLoaded({
    required this.recommendations,
    required this.currentPage,
    this.isLoadingNextPage = false,
  });

  FeedLoaded copyWith({
    List<Recommendation>? recommendations,
    int? currentPage,
    bool? isLoadingNextPage,
  }) {
    return FeedLoaded(
      recommendations: recommendations ?? this.recommendations,
      currentPage: currentPage ?? this.currentPage,
      isLoadingNextPage: isLoadingNextPage ?? this.isLoadingNextPage,
    );
  }
}
