import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/dependency_injection.dart';
import 'package:movie_app_bloc/core/services/session_controller.dart';
import 'package:movie_app_bloc/features/auth/data/repository/login_repository.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = getIt<LoginRepository>();

  LoginBloc() : super(LoginState()) {
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(status: PostApiStatus.loading));
      try {
        final user = await loginRepository.login({
          'username': state.email,
          'password': state.password,
        });
        if (user.hasError) {
          emit(
            state.copyWith(status: PostApiStatus.error, message: user.message),
          );
        } else {
          await SessionController().saveUserInPreferences(user);
          await SessionController().getUserFromPreferences();
          emit(
            state.copyWith(
              status: PostApiStatus.success,
              message: user.accessToken,
            ),
          );
        }
      } catch (error) {
        emit(
          state.copyWith(
            status: PostApiStatus.error,
            message: error.toString(),
          ),
        );
      }
    });
  }
}
