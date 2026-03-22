import 'package:movie_app_bloc/core/constaints/app_url.dart';
import 'package:movie_app_bloc/core/network/network_services_api.dart';
import 'package:movie_app_bloc/features/auth/data/models/user_model.dart';
import 'package:movie_app_bloc/features/auth/data/repository/login_repository.dart';

class LoginHttpApiRepository implements LoginRepository {
  final api = NetworkServicesApi();
  @override
  Future<UserModel> login(dynamic data) async {
    final response = await api.postApi(AppUrl.loginUrl, data);
    return UserModel.fromJson(response);
  }
}
