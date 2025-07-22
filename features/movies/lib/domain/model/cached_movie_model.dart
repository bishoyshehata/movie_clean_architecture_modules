import 'package:hive/hive.dart';
part 'cached_movie_model.g.dart';

@HiveType(typeId: 1)
class ChachedMovieModel {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String posterPath;

  @HiveField(2)
  final String voteAverage;

  @HiveField(3)
  final  String originalTitle;

  @HiveField(4)
  final String overview;

  @HiveField(5)
  final String releaseDate;

  @HiveField(6)
  final String title;

  ChachedMovieModel({
    required this.id,
    required this.posterPath,
    required this.voteAverage,
    required this.originalTitle,
    required this.title,
    required this.overview,
    required this.releaseDate,
  });
}
