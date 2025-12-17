import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/widgets.dart';
import '../providers/auth_provider.dart';

/// Login page for cashier authentication.
///
/// Features a modern, minimal design with:
/// - Clean centered card layout
/// - Subtle shadows and rounded corners
/// - Primary color accents
/// - Smooth loading states
/// - Clear error feedback via toasts
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _usernameController = TextEditingController();
  final _accessKeyController = TextEditingController();
  bool _isLoading = false;
  String? _usernameError;
  String? _accessKeyError;

  @override
  void dispose() {
    _usernameController.dispose();
    _accessKeyController.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      _usernameError =
          _usernameController.text.isEmpty ? 'Username is required' : null;
      _accessKeyError =
          _accessKeyController.text.isEmpty ? 'Access key is required' : null;
    });
    return _usernameError == null && _accessKeyError == null;
  }

  Future<void> _handleLogin() async {
    if (!_validate()) {
      return;
    }

    setState(() => _isLoading = true);

    await ref.read(authNotifierProvider.notifier).login(
          username: _usernameController.text.trim(),
          accessKey: _accessKeyController.text,
        );

    if (!mounted) return;
    setState(() => _isLoading = false);

    // Check if login failed (show error)
    // On success, the router's refreshListenable will automatically redirect to home
    final authState = ref.read(authNotifierProvider);
    authState.whenOrNull(
      error: (error, _) {
        final message = _getErrorMessage(error);
        AppToast.error(
          context,
          title: 'Login Failed',
          message: message,
        );
      },
    );
  }

  String _getErrorMessage(Object error) {
    if (error is Failure) {
      return error.when(
        server: (message, _) => message,
        network: (message) => message,
        cache: (message) => message,
        auth: (message) => message,
        validation: (message, _, __) => message,
        unknown: (message) => message,
      );
    }
    return 'An unexpected error occurred';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.background,
              AppColors.muted,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo/Brand Section
                  AppIconBox(
                    icon: Icons.store,
                    backgroundColor: AppColors.primary,
                    iconColor: AppColors.primaryForeground,
                    size: 72,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'FST POS',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to your cashier account',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Login Card
                  AppCard(
                    elevation: 1,
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Username field
                        AppTextField(
                          controller: _usernameController,
                          label: 'Username',
                          hintText: 'Enter your username',
                          prefixIcon: Icons.person_outline,
                          errorText: _usernameError,
                          onChanged: (_) {
                            if (_usernameError != null) {
                              setState(() => _usernameError = null);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        // Access Key field
                        AppTextField(
                          controller: _accessKeyController,
                          label: 'Access Key',
                          hintText: 'Enter your access key',
                          prefixIcon: Icons.key_outlined,
                          obscureText: true,
                          showPasswordToggle: true,
                          errorText: _accessKeyError,
                          onChanged: (_) {
                            if (_accessKeyError != null) {
                              setState(() => _accessKeyError = null);
                            }
                          },
                        ),
                        const SizedBox(height: 28),
                        // Sign In button
                        AppButton.primary(
                          onPressed: _isLoading ? null : _handleLogin,
                          isLoading: _isLoading,
                          isExpanded: true,
                          icon: _isLoading
                              ? null
                              : const Icon(
                                  Icons.arrow_forward,
                                  size: 18,
                                  color: Colors.white,
                                ),
                          child: Text(_isLoading ? 'Signing in...' : 'Sign In'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Footer text
                  Text(
                    'Secure cashier authentication',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
