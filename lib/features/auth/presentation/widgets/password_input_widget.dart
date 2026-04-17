import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/features/auth/presentation/bloc/login_bloc.dart';
import 'package:movie_app_bloc/core/utils/validations_mixin.dart';

class PasswordInputWidget extends StatefulWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  late TextEditingController _controller;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: context.read<LoginBloc>().state.password,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.password != current.password &&
          current.password != _controller.text,
      listener: (context, state) => _controller.text = state.password,
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.visiblePassword,
        focusNode: widget.passwordFocusNode,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'emilyspass',

          prefixIcon: const Icon(Icons.lock_outline),
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => _obscureText = !_obscureText),
          ),
        ),
        onChanged: (value) {
          context.read<LoginBloc>().add(PasswordChanged(value));
        },
        validator: (value) =>
            ValidationMixin.validateRequired(value, 'Password'),
      ),
    );
  }
}
