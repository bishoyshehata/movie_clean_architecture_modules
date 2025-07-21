class MovieModel {

  /// we make it non-nullable because we will make a mapper for the empty model

  String id;
  String posterPath;
  String voteAverage;
  String originalTitle;
  String overview;
  String releaseDate;
  String title;

  MovieModel({
    required this.id,
    required this.posterPath,
    required this.voteAverage,
    required this.originalTitle,
    required this.title,
    required this.overview,
    required this.releaseDate,
  });
}
