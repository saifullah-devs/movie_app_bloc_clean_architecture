import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/features/auth/domain/entities/user_entity.dart';
import 'package:movie_app_bloc/core/usecase/usecase.dart';

import '../../domain/repository/login_api_repository.dart'; // The base class above

class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<UserEntity> call(LoginParams params) async {
    final requestData = {'username': params.email, 'password': params.password};

    return await repository.login(requestData);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
