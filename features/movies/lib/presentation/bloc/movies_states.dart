import 'package:equatable/equatable.dart';
import 'package:movies/domain/model/movie_model.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class MoviesState extends Equatable {
  // final List<MovieModel>? movies;
  final String? errorMessage;
  final StateRendererType stateRendererType;

  const MoviesState(
      {
        // this.movies,
        this.errorMessage,
        this.stateRendererType = StateRendererType.emptyState
      });

  MoviesState copyWith({
    List<MovieModel>? movies,
    String? errorMessage,
    StateRendererType? loginState
  }) {
    return MoviesState(
        // movies: movies,
        errorMessage: errorMessage,
        stateRendererType: stateRendererType  );
  }

  @override
  List<Object?> get props => [ errorMessage,stateRendererType];
}

// initial state
class MoviesInitial extends MoviesState {
  const MoviesInitial():super(stateRendererType: StateRendererType.emptyState);
}

// loading state
class MoviesLoading extends MoviesState {
  const MoviesLoading():super(stateRendererType: StateRendererType.fullScreenLoadingState);

}// empty state
class MoviesEmpty extends MoviesState {
  const MoviesEmpty():super(stateRendererType: StateRendererType.emptyState);

}

// success state
class MoviesSuccess extends MoviesState {
  final List<MovieModel>? movies;

  const MoviesSuccess({required this.movies}):super(stateRendererType: StateRendererType.contentState);

}

// error state
class MoviesError extends MoviesState {
  final String? errorMessage;

  const MoviesError({this.errorMessage })
      : super(errorMessage: errorMessage,stateRendererType: StateRendererType.fullScreenErrorState);
}