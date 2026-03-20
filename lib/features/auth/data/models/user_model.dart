import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    // --- LOGIN IDENTITY ---
    @Default(-1) int id,
    @Default('') String username,
    @Default('') String email,

    // --- SESSION MANAGEMENT ---
    @JsonKey(name: 'accessToken') @Default('') String accessToken,
    @JsonKey(name: 'refreshToken') @Default('') String refreshToken,

    // --- ERROR HANDLING ---
    @Default('') String message,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  // Helper getters
  bool get isAuthenticated => accessToken.isNotEmpty;
  bool get hasError => message.isNotEmpty;
}
