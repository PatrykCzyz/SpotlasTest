import 'package:flutter/material.dart';
import 'package:spotlas_test/presentation/feed/recommendation/recommendation_widget.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feed',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, height: 1.333),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const RecommendationWidget();
        },
      ),
    );
  }
}
