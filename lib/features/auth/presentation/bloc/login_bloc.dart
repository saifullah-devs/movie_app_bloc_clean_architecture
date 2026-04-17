import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/core/services/session_controller.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';

import '../../data/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final SessionController _sessionController;

  LoginBloc({
    required LoginUseCase loginUseCase,
    required SessionController sessionController,
  }) : _loginUseCase = loginUseCase,
       _sessionController = sessionController,
       super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }
  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    // Updates the email in the state and resets the status to initial
    emit(state.copyWith(email: event.email, status: PostApiStatus.initial));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    // Updates the password in the state and resets the status to initial
    emit(
      state.copyWith(password: event.password, status: PostApiStatus.initial),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: PostApiStatus.loading));

    // Create the params object
    final params = LoginParams(email: state.email, password: state.password);

    try {
      final user = await _loginUseCase(params);

      if (user.hasError) {
        emit(
          state.copyWith(status: PostApiStatus.error, message: user.message),
        );
      } else {
        await _sessionController.saveUserInPreferences(user);
        emit(
          state.copyWith(
            status: PostApiStatus.success,
            message: "Welcome back!",
          ),
        );
      }
    } on Exception catch (e) {
      emit(state.copyWith(status: PostApiStatus.error, message: e.toString()));
    }
  }
}
