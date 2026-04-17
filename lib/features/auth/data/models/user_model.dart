import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.username,
    super.email,
    super.accessToken,
    super.refreshToken,
    super.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? -1,
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'message': message,
    };
  }

  // Optional: Mapper to easily convert Entity back to Model if needed
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.username,
      email: entity.email,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      message: entity.message,
    );
  }
}
