part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent {}

class FetchData extends FeedEvent {}

class FetchNextPage extends FeedEvent {}

class ToggleBookmark extends FeedEvent {
  final Recommendation recommendation;

  ToggleBookmark(this.recommendation);
}

class ToggleLike extends FeedEvent {
  final Recommendation recommendation;

  ToggleLike(this.recommendation);
}
