import 'package:movie_app_bloc/features/auth/data/models/user_model.dart';
import 'package:movie_app_bloc/features/auth/data/repository/login_repository.dart';

class LoginMockApiRepository implements LoginRepository {
  @override
  Future<UserModel> login(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = {'accessToken': 'mock_access_token'};
    return UserModel.fromJson(response);
  }
}
