import 'package:movie_app_bloc/features/auth/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> login(dynamic data);
}
