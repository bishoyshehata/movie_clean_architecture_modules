import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/usecase/login_usecase_impl.dart';
import 'package:login/presentation/controller/login_events.dart';
import 'package:login/presentation/controller/login_states.dart';

import '../../domain/usecase/movies_usecase.dart';
import 'movies_events.dart';
import 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  MoviesUseCase moviesUseCase;

  MoviesBloc(this.moviesUseCase) : super(MoviesInitial()) {
    on<MoviesGetterEvent>((event, emit) async {
      emit(MoviesLoading());

      final result = await moviesUseCase.execute("");
      result.fold(
        (failure) {
          emit(MoviesError(errorMessage: failure.message));
          print("Error ${failure.message}");
          print("Error ${failure.statusCode}");
        },
        (movies) {
          if(movies.isEmpty){
            emit(MoviesEmpty());
          }else{
            print("Movies success ${movies}");
            emit(MoviesSuccess(movies: movies));
          }

        },
      );
    });
  }
}
