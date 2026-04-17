import 'package:movie_app_bloc/core/constaints/app_url.dart';
import 'package:movie_app_bloc/core/network/network_services_api.dart';
import 'package:movie_app_bloc/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(dynamic data);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkServicesApi _api;

  AuthRemoteDataSourceImpl(this._api);

  @override
  Future<UserModel> login(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginUrl, data);
    return UserModel.fromJson(response);
  }
}
