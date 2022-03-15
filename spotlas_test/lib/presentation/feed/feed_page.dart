import 'package:flutter/material.dart';
import 'package:spotlas_test/application/feed/feed_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';
import 'package:spotlas_test/main.dart';
import 'package:spotlas_test/presentation/feed/recommendation/recommendation_list_widget.dart';
import 'package:spotlas_test/presentation/feed/recommendation/recommendation_widget.dart';
import 'package:spotlas_test/presentation/misc/size_helper.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FeedBloc>()..add(FetchData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Feed',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, height: 1.333),
          ),
        ),
        body: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state is! FeedLoaded) {
              return const Center(child: CircularProgressIndicator());
            }
            
            return RecommendationListWidget(state.recommendations);
          },
        ),
      ),
    );
  }
}
