import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlas_test/application/feed/feed_bloc.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';
import 'package:spotlas_test/presentation/feed/recommendation/recommendation_widget.dart';
import 'package:spotlas_test/presentation/misc/size_enum.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class RecommendationListWidget extends StatefulWidget {
  final List<Recommendation> recommendations;

  const RecommendationListWidget(
    this.recommendations, {
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendationListWidget> createState() =>
      _RecommendationListWidgetState();
}

class _RecommendationListWidgetState extends State<RecommendationListWidget> {
  final _scrollController = ScrollController();
  bool _isLoadingNextPage = false;
  static const _itemHeight = 700; // TODO moze da sie prawdziwa wartosc

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (!_isLoadingNextPage &&
          _itemHeight * 5 > _scrollController.position.extentAfter) {
        context.read<FeedBloc>().add(FetchNextPage());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedBloc, FeedState>(
      listener: (context, state) {
        if (state is FeedLoaded) {
          setState(() {
            _isLoadingNextPage = state.isLoadingNextPage;
          });
        }
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.recommendations.length + 1,
        itemBuilder: (context, index) {
          if (index == widget.recommendations.length) {
            return _isLoadingNextPage
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeHelper.vertical(context, SizeEnum.l),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  )
                : Container();
          }

          final recommendation = widget.recommendations[index];

          return RecommendationWidget(recommendation);
        },
      ),
    );
  }
}
