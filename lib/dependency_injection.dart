import 'package:get_it/get_it.dart';
import 'package:movie_app_bloc/core/network/network_services_api.dart';
import 'package:movie_app_bloc/core/services/session_controller.dart';
import 'package:movie_app_bloc/core/storage/local_storage.dart';
import 'package:movie_app_bloc/core/storage/secure_storage_impl.dart';
import 'package:movie_app_bloc/features/auth/data/usecases/login_usecase.dart';

// Auth Feature
import 'package:movie_app_bloc/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movie_app_bloc/features/auth/domain/repository/login_api_repository.dart';
import 'package:movie_app_bloc/features/auth/data/repository/login_http_api_repository.dart';
import 'package:movie_app_bloc/features/auth/presentation/bloc/login_bloc.dart';

// Movie Feature
import 'package:movie_app_bloc/features/tv_show/data/repository/tv_show_repository.dart';
import 'package:movie_app_bloc/features/tv_show/data/datasource/tv_show_remote_data_source.dart';
import 'package:movie_app_bloc/features/tv_show/domain/usecases/usecase.dart';
import 'package:movie_app_bloc/features/tv_show/presentation/bloc/tv_show_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupServicesLocator() {
  _initCore();
  _initAuthFeature();
  _initMovieFeature();
}

void _initCore() {
  getIt.registerLazySingleton<NetworkServicesApi>(() => NetworkServicesApi());
  getIt.registerLazySingleton<LocalStorage>(() => SecureStorageImpl());
  getIt.registerLazySingleton<SessionController>(() => SessionController());
}

void _initAuthFeature() {
  // Data Source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginHttpApiRepository(remoteDataSource: getIt()),
  );

  // Use Case
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));

  // BLoC
  getIt.registerFactory(
    () => LoginBloc(loginUseCase: getIt(), sessionController: getIt()),
  );
}

void _initMovieFeature() {
  // Data Source
  getIt.registerLazySingleton<TvShowRemoteDataSource>(
    () => TvShowRemoteDataSourceImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<TvShowRepository>(
    () => TvShowHttpApiRepository(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton<GetPopularTvShowsUseCase>(
    () => GetPopularTvShowsUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetRecentTvShowsUseCase>(
    () => GetRecentTvShowsUseCase(getIt()),
  );

  // BLoC
  getIt.registerFactory(
    () => TvShowBloc(popularUseCase: getIt(), recentUseCase: getIt()),
  );
}
