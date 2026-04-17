import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/features/auth/presentation/bloc/login_bloc.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        final isLoading = state.status == PostApiStatus.loading;

        return SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: isLoading ? null : () => _handleLogin(context),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        );
      },
    );
  }

  void _handleLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(const LoginSubmitted());
    }
  }
}
