import 'package:spotlas_test/infrastructure/feed/dtos/photo_resolution.dart';
import 'package:spotlas_test/infrastructure/feed/dtos/tag.dart';

class Recommendation {
  final String id;
  final DateTime createdAt;
  final String description;
  final String authorUsername;
  final String authorFullName;
  final String placeName;
  final String placeLocationName;
  final String placeLocationNameO;
  final String categoryDisplayName;
  final List<PhotoResolution> photosResolutions;
  final PhotoResolution authorPhotosResolutions;
  final bool isLiked;
  final bool isBookmarked;
  final int numberOfPhotos;
  final String placeLogoUrl;
  final List<Tag> tags;

  Recommendation({
    required this.id,
    required this.createdAt,
    required this.description,
    required this.authorUsername,
    required this.authorFullName,
    required this.placeName,
    required this.placeLocationName,
    required this.placeLocationNameO,
    required this.categoryDisplayName,
    required this.photosResolutions,
    required this.authorPhotosResolutions,
    required this.isLiked,
    required this.isBookmarked,
    required this.numberOfPhotos,
    required this.placeLogoUrl,
    required this.tags,
  });

  factory Recommendation.fromMap(Map<String, dynamic> map) {
    return Recommendation(
      id: map['id'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      description: map['description'] ?? '',
      authorUsername: map['authorUsername'] ?? '',
      authorFullName: map['authorFullName'] ?? '',
      placeName: map['placeName'] ?? '',
      placeLocationName: map['placeLocationName'] ?? '',
      placeLocationNameO: map['placeLocationNameO'] ?? '',
      categoryDisplayName: map['categoryDisplayName'] ?? '',
      photosResolutions: map['photosResolutions'] != null
          ? (map['photosResolutions'] as Iterable)
              .map((e) => PhotoResolution.fromMap(e))
              .toList()
          : <PhotoResolution>[],
      authorPhotosResolutions:
          PhotoResolution.fromMap(map['authorPhotosResolutions']),
      isLiked: map['isLiked'] ?? false,
      isBookmarked: map['isBookmarked'] ?? false,
      numberOfPhotos: map['numberOfPhotos']?.toInt() ?? 0,
      placeLogoUrl: map['placeLogoUrl'] ?? '',
      tags: (map['tags_'] as Iterable).map((e) => Tag.fromMap(e)).toList(),
    );
  }

  Recommendation copyWith({
    String? id,
    DateTime? createdAt,
    String? description,
    String? authorUsername,
    String? authorFullName,
    String? placeName,
    String? placeLocationName,
    String? placeLocationNameO,
    String? categoryDisplayName,
    List<PhotoResolution>? photosResolutions,
    PhotoResolution? authorPhotosResolutions,
    bool? isLiked,
    bool? isBookmarked,
    int? numberOfPhotos,
    String? placeLogoUrl,
    List<Tag>? tags,
  }) {
    return Recommendation(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      authorUsername: authorUsername ?? this.authorUsername,
      authorFullName: authorFullName ?? this.authorFullName,
      placeName: placeName ?? this.placeName,
      placeLocationName: placeLocationName ?? this.placeLocationName,
      placeLocationNameO: placeLocationNameO ?? this.placeLocationNameO,
      categoryDisplayName: categoryDisplayName ?? this.categoryDisplayName,
      photosResolutions: photosResolutions ?? this.photosResolutions,
      authorPhotosResolutions: authorPhotosResolutions ?? this.authorPhotosResolutions,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      numberOfPhotos: numberOfPhotos ?? this.numberOfPhotos,
      placeLogoUrl: placeLogoUrl ?? this.placeLogoUrl,
      tags: tags ?? this.tags,
    );
  }
}
