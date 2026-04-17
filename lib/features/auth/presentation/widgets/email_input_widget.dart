import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/features/auth/presentation/bloc/login_bloc.dart';
import 'package:movie_app_bloc/core/utils/validations_mixin.dart';

class EmailInputWidget extends StatefulWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize controller with current bloc state
    _controller = TextEditingController(
      text: context.read<LoginBloc>().state.email,
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
          previous.email != current.email && current.email != _controller.text,
      listener: (context, state) => _controller.text = state.email,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!kIsWeb && Platform.isIOS)
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.emailAddress,
            focusNode: widget.emailFocusNode,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: 'emilys',
              labelText: (kIsWeb || !Platform.isIOS) ? 'User' : null,
              prefixIcon: const Icon(Icons.email_outlined),
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChanged(value));
            },
            validator: (value) =>
                ValidationMixin.validateRequired(value, 'User'),
          ),
        ],
      ),
    );
  }
}
