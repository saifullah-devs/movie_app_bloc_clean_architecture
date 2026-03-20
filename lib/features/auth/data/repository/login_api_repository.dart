import 'package:movie_app_bloc/features/auth/data/models/user/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> login(dynamic data);
}
