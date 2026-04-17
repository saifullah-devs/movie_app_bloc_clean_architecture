import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/core/config/color/colors.dart';
import 'package:movie_app_bloc/core/config/routes/routes_name.dart';
import 'package:movie_app_bloc/core/utils/flash_bar_helper.dart';
import 'package:movie_app_bloc/dependency_injection.dart'; // Ensure getIt is imported
import 'package:movie_app_bloc/features/auth/presentation/bloc/login_bloc.dart';
import 'package:movie_app_bloc/core/utils/enum.dart';
import '../widgets/email_input_widget.dart';
import '../widgets/password_input_widget.dart';
import '../widgets/login_button.dart';

// 1. THE SCREEN (Handles Dependency Injection)
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const LoginView(),
    );
  }
}

// 2. THE VIEW (Handles UI and State)
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Now this BlocListener will successfully find the BlocProvider right above it!
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == PostApiStatus.loading) {
          FlashBarHelper.flashBarLoadingMessage(context, 'Submitting login...');
        } else if (state.status == PostApiStatus.success) {
          FlashBarHelper.flashBarSuccessMessage(context, 'Login Successful');
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
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 450),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 40),

                      EmailInputWidget(emailFocusNode: _emailFocusNode),
                      const SizedBox(height: 16),

                      PasswordInputWidget(
                        passwordFocusNode: _passwordFocusNode,
                      ),
                      const SizedBox(height: 24),

                      LoginButton(formKey: _formKey),

                      const SizedBox(height: 16),
                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Icon(Icons.movie_filter, size: 80, color: AppColors.primaryColor),
        const SizedBox(height: 16),
        Text(
          "TV Show App",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const Text("Enter your credentials to continue"),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    if (!kIsWeb && Platform.isIOS) {
      return const CupertinoNavigationBar(middle: Text('Login'));
    }
    return AppBar(elevation: 0, backgroundColor: Colors.transparent);
  }

  Widget _buildFooter() {
    return TextButton(
      onPressed: () {},
      child: const Text("Don't have an account? Sign Up"),
    );
  }
}
