import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_flutter_task/features/home/data/data_source/data_source.dart';
import 'package:weather_flutter_task/features/home/data/repo/home_repo_imp.dart';
import 'package:weather_flutter_task/features/home/domain/repo/home_repo.dart';
import 'package:weather_flutter_task/features/home/presentation/controller/home_cubit.dart';

final sl = GetIt.instance;
init() {
  sl.registerFactory(() => HomeCubit(homeRepo: sl()));
  sl.registerLazySingleton<HomeDataSource>(
    () => HomeDataSource(createAndSetupDio()),
  );
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(homeDataSource: sl()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio.interceptors.addAll([AppendHeaderInterceptor()]);

  // dio
  // ..options.connectTimeout = const Duration(seconds: 5)
  // ..options.receiveTimeout = const Duration(seconds: 5);

  dio.interceptors.add(PrettyDioLogger(
    requestBody: true,
    error: true,
    requestHeader: true,
    responseHeader: true,
    responseBody: true,
  ));
  return dio;
}

class AppendHeaderInterceptor extends Interceptor {
  AppendHeaderInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = 'application/json';
    // options.headers['authorization'] = sl<UserPreferenceRepo>().getAccessToken();
    // options.queryParameters['lang'] = sl<UserPreferenceRepo>().getLanguage();
    return super.onRequest(options, handler);
  }
}
