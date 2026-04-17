import '../../domain/entities/user_entity.dart';

import '../datasources/auth_remote_data_source.dart';
import '../../domain/repository/login_api_repository.dart';

class LoginHttpApiRepository implements LoginRepository {
  final AuthRemoteDataSource remoteDataSource;

  LoginHttpApiRepository({required this.remoteDataSource});

  @override
  Future<UserEntity> login(dynamic data) async {
    return await remoteDataSource.login(data);
  }
}
