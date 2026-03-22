import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/features/auth/presentation/bloc/login_bloc.dart';
import 'package:movie_app_bloc/core/utils/validations_mixin.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,

      builder: (context, state) {
        return TextFormField(
          initialValue: state.password,
          keyboardType: TextInputType.visiblePassword,
          focusNode: passwordFocusNode,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
          onChanged: (value) {
            context.read<LoginBloc>().add(
              LoginPasswordChanged(password: value),
            );
          },
          validator: (value) => ValidationMixin.validatePassword(value ?? ''),
        );
      },
    );
  }
}
