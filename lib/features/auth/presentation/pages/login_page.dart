import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_colors.dart';
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
  bool _obscurePassword = true;
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

    // Check if login was successful
    final authState = ref.read(authNotifierProvider);
    authState.whenOrNull(
      data: (state) {
        state.whenOrNull(
          authenticated: (_, __) {
            context.go(AppRoutes.home);
          },
        );
      },
      error: (error, _) {
        final message = _getErrorMessage(error);
        showToast(
          context: context,
          builder: (context, overlay) => SurfaceCard(
            child: Basic(
              leading: Icon(
                LucideIcons.circleAlert,
                color: AppColors.destructive,
              ),
              title: const Text('Login Failed'),
              subtitle: Text(message),
              trailing: GhostButton(
                density: ButtonDensity.icon,
                onPressed: overlay.close,
                child: const Icon(LucideIcons.x),
              ),
            ),
          ),
          location: ToastLocation.topCenter,
          showDuration: const Duration(seconds: 4),
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
        validation: (message, _) => message,
        unknown: (message) => message,
      );
    }
    return 'An unexpected error occurred';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final destructiveColor = theme.colorScheme.destructive;

    return Scaffold(
      child: Container(
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
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Icon(
                      LucideIcons.store,
                      size: 36,
                      color: AppColors.primaryForeground,
                    ),
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
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.border,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Username field
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _usernameController,
                          placeholder: const Text('Enter your username'),
                          features: [
                            InputFeature.leading(
                              Icon(
                                LucideIcons.user,
                                size: 18,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ],
                          onChanged: (_) {
                            if (_usernameError != null) {
                              setState(() => _usernameError = null);
                            }
                          },
                        ),
                        if (_usernameError != null) ...[
                          const SizedBox(height: 6),
                          Text(
                            _usernameError!,
                            style: TextStyle(
                              fontSize: 13,
                              color: destructiveColor,
                            ),
                          ),
                        ],
                        const SizedBox(height: 20),
                        // Access Key field
                        Text(
                          'Access Key',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _accessKeyController,
                          placeholder: const Text('Enter your access key'),
                          obscureText: _obscurePassword,
                          features: [
                            InputFeature.leading(
                              Icon(
                                LucideIcons.keyRound,
                                size: 18,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                            InputFeature.passwordToggle(),
                          ],
                          onChanged: (_) {
                            if (_accessKeyError != null) {
                              setState(() => _accessKeyError = null);
                            }
                          },
                        ),
                        if (_accessKeyError != null) ...[
                          const SizedBox(height: 6),
                          Text(
                            _accessKeyError!,
                            style: TextStyle(
                              fontSize: 13,
                              color: destructiveColor,
                            ),
                          ),
                        ],
                        const SizedBox(height: 28),
                        // Sign In button
                        PrimaryButton(
                          onPressed: _isLoading ? null : _handleLogin,
                          child: _isLoading
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.primaryForeground,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text('Signing in...'),
                                  ],
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Sign In'),
                                    const SizedBox(width: 8),
                                    Icon(
                                      LucideIcons.arrowRight,
                                      size: 18,
                                      color: AppColors.primaryForeground,
                                    ),
                                  ],
                                ),
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
