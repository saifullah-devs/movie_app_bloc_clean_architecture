import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String username;
  final String email;
  final String accessToken;
  final String refreshToken;
  final String message;

  const UserEntity({
    this.id = -1,
    this.username = '',
    this.email = '',
    this.accessToken = '',
    this.refreshToken = '',
    this.message = '',
  });

  // Business Logic Getters
  bool get isAuthenticated => accessToken.isNotEmpty;
  bool get hasError => message.isNotEmpty;

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    accessToken,
    refreshToken,
    message,
  ];
}
