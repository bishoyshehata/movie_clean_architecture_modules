import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents();

  @override
  List<Object?> get props => [];
}

// Event to fetch movies
class MoviesGetterEvent extends MoviesEvents {
  const MoviesGetterEvent();

  @override
  List<Object?> get props => [];
}