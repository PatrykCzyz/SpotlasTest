import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';

class FeedRepository {
  Future<List<Recommendation>> getFeed(int page) async {
    final feedApiResult = await http.get(Uri.parse(
        'http://161.35.162.216:1210/interview/home/reel?lat=51.5&lon=-0.17&page=$page'));

    final recommendationsJson = json.decode(feedApiResult.body);
    final recommendations = List.from(recommendationsJson)
        .map((e) => Recommendation.fromMap(e as Map<String, dynamic>))
        .toList();

    return recommendations;
  }
}
