import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/core/api/api_errors.dart';
import 'package:movies_app/core/api/api_services.dart';
import 'package:movies_app/features/home/models/movie_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ApiServices _apiServices;
  SearchCubit(this._apiServices) : super(SearchInitial());

  Future<void> searchMovies(String query) async {
    emit(SearchLoading());
    try {
      final response = await _apiServices.searchedMovies(
        query,
        ApiConstants.apiKey,
      );

      emit(SearchSuccess(movies: response.results ?? []));
    }
     on DioException catch (e) {
      final apiError = ApiError.fromDioError(e);
      emit(SearchFailure(error: apiError.message));
    }
    catch (e) {
      emit(SearchFailure(error: e.toString()));
    }
  }
}
