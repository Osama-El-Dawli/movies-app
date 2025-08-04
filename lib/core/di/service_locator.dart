import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/api/api_services.dart';
import 'package:movies_app/core/di/my_bloc_observer.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ServiceLocator {
  static final getIt = GetIt.instance;

  static void setup() {
    final dio = Dio();

    Bloc.observer = MyBlocObserver();

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }

    getIt.registerLazySingleton<Dio>(() => dio);
    getIt.registerLazySingleton<ApiServices>(() => ApiServices(getIt<Dio>()));
  }
}
