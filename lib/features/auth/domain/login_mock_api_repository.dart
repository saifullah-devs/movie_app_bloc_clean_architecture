import 'package:movie_app_bloc/features/auth/domain/entities/user_entity.dart';
import 'package:movie_app_bloc/features/auth/data/models/user_model.dart';

import 'repository/login_api_repository.dart';

class LoginMockApiRepository implements LoginRepository {
  @override
  Future<UserEntity> login(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));

    final mockResponse = {
      'id': 1,
      'username': 'mock_user',
      'email': 'mock@example.com',
      'accessToken': 'mock_access_token',
      'refreshToken': 'mock_refresh_token',
    };

    return UserModel.fromJson(mockResponse);
  }
}
