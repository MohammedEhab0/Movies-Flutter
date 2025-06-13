import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Data/models/MovieRespone.dart';
import 'package:movies/api/EndPoints.dart';
import 'package:movies/api/apiConstants.dart';
import 'package:movies/api/apiManger.dart';
import 'package:movies/ui/homescreen/tabs/home/Cubit/movie_states.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesLoading());
  final apimanger = ApiManger();

  Future<void> fetchMovies() async {
    emit(MoviesLoading());

    try {
      emit(MoviesLoading());
      var response = await apimanger.getData(
          baseUrl: ApiConstants.moviesBaseUrl, endPoint: EndPoints.listMovies);

      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        emit(MoviesError(response.statusMessage!));
        return;
      }

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final moviesResponse = MoviesResponse.fromJson(response.data);

        emit(MoviesSucess(moviesResponse.data!.movies ?? []));
        return;
      }
    } catch (e) {
      emit(MoviesError('Connection error: ${e.toString()}'));
    }
  }
}
