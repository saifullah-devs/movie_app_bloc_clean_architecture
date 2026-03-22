import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/core/config/routes/routes_name.dart';
import 'package:movie_app_bloc/features/auth/presentation/bloc/login_bloc.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';
import 'package:movie_app_bloc/core/utils/flash_bar_helper.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == PostApiStatus.loading) {
          FlashBarHelper.flashBarLoadingMessage(context, 'Submitting login...');
        } else if (state.status == PostApiStatus.success) {
          FlashBarHelper.flashBarSuccessMessage(
            context,
            'Login Successful: ${state.message}',
          );
          Future.delayed(const Duration(seconds: 2), () {
            if (context.mounted) {
              Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
            }
          });
        } else if (state.status == PostApiStatus.error) {
          FlashBarHelper.flashBarErrorMessage(
            context,
            'Login Failed: ${state.message}',
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,

        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginSubmitted());
              }
            },
            child: PostApiStatus.loading == state.status
                ? const CircularProgressIndicator()
                : const Text('Login'),
          );
        },
      ),
    );
  }
}
