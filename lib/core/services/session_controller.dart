import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:movie_app_bloc/features/auth/domain/entities/user_entity.dart';
import 'package:movie_app_bloc/features/auth/data/models/user_model.dart';
import '../../dependency_injection.dart';
import '../storage/local_storage.dart';

class SessionController {
  static final SessionController _instance = SessionController._internal();

  factory SessionController() => _instance;

  SessionController._internal();

  final LocalStorage _localStorage = getIt<LocalStorage>();

  // Use Entity for the public state
  UserEntity? user;
  bool isLoggedIn = false;

  /// Saves the user. Accepts Entity to stay compatible with Domain layer.
  Future<void> saveUserInPreferences(UserEntity userEntity) async {
    // Convert Entity to Model for JSON serialization
    final model = UserModel.fromEntity(userEntity);

    await _localStorage.setValue('user_data', jsonEncode(model.toJson()));
    await _localStorage.setValue('isLoggedIn', 'true');

    user = userEntity;
    isLoggedIn = true;
  }

  /// Retrieves the user and maps it back to an Entity.
  Future<UserEntity?> getUserFromPreferences() async {
    try {
      final String? userData = await _localStorage.getValue('user_data');
      final String? isLoginString = await _localStorage.getValue('isLoggedIn');

      if (userData != null && userData.isNotEmpty) {
        final Map<String, dynamic> userMap = jsonDecode(userData);

        // Use Model to parse, then store as Entity
        user = UserModel.fromJson(userMap);
        isLoggedIn = (isLoginString == 'true');
        return user;
      } else {
        _resetSession();
      }
    } catch (e) {
      debugPrint('Error retrieving user data: $e');
      _resetSession();
    }
    return null;
  }

  Future<void> clearSession() async {
    await _localStorage.clearValue('user_data');
    await _localStorage.setValue('isLoggedIn', 'false');
    _resetSession();
  }

  void _resetSession() {
    user = null;
    isLoggedIn = false;
  }
}
