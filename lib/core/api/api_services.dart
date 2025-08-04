import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_constants.dart';
import 'package:movies_app/features/home/models/movie_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET(ApiConstants.searchEndPoint)
  Future<ModelResponse> searchedMovies(
    @Query('query') String query,
    @Query('api_key') String apiKey,
    // @Header('Authorization') String apiKey,
  );
}
