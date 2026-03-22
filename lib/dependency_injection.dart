import 'package:get_it/get_it.dart';
import 'package:movie_app_bloc/core/services/session_controller.dart';
import 'package:movie_app_bloc/core/storage/local_storage.dart';
import 'package:movie_app_bloc/core/storage/secure_storage_impl.dart';
import 'package:movie_app_bloc/features/auth/data/repository/login_repository.dart';
import 'package:movie_app_bloc/features/movies/data/repository/movies_repository.dart';

final GetIt getIt = GetIt.instance;

void setupServicesLocator() {
  // Storage
  getIt.registerLazySingleton<LocalStorage>(() => SecureStorageImpl());

  // Services
  getIt.registerLazySingleton<SessionController>(() => SessionController());

  // Login Repositories
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());

  // Movies Repositories
  getIt.registerLazySingleton<MoviesApiRepository>(
    () => MoviesHttpApiRepository(),
  );
}
