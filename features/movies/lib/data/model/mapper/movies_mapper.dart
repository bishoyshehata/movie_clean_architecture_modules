import 'package:extensions/constants/constants.dart';
import 'package:extensions/extensions.dart';
import 'package:movies/data/response/movie_response.dart';
import '../../response/movies_response.dart';
import '../movie_model.dart';

// for Movie
extension MovieResponseMapper on MovieResponse? {
  MovieModel toDomain() {
    return MovieModel(
      id: this?.id.orEmpty() ?? Constants.empty,
      releaseDate: this?.releaseDate.orEmpty() ?? Constants.empty,
      overview: this?.overview.orEmpty() ?? Constants.empty,
      title: this?.title.orEmpty() ?? Constants.empty,
      originalTitle: this?.originalTitle.orEmpty() ?? Constants.empty,
      posterPath: this?.posterPath.orEmpty() ?? Constants.empty,
      voteAverage: this?.voteAverage.orEmpty() ?? Constants.empty,
    );
  }
}
// for Movies
extension MoviesResponseMapper on MoviesResponse? {
  List<MovieModel> toDomain() {
    List<MovieModel> movies =
    // Convert the list of MovieResponse to a list of MovieModel
        (this?.movies
                    ?.map((movieResponse) => movieResponse.toDomain())
                    .toList() ??
            // If the movies list is null, return an empty list
                const Iterable.empty())
            .cast<MovieModel>()
            .toList();

    return movies;
  }
}
