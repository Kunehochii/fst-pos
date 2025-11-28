import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/router/app_router.dart';
import '../providers/auth_provider.dart';

/// Login page for cashier authentication.
///
/// Features:
/// - Username and access key input
/// - Error handling with user-friendly messages
/// - Loading state during login
/// - Automatic redirect on successful login
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
              leading: const Icon(LucideIcons.circleAlert),
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
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Card(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('FST POS').h2().textCenter(),
                  const SizedBox(height: 8),
                  const Text('Sign in to your cashier account')
                      .muted()
                      .textCenter(),
                  const SizedBox(height: 24),
                  // Username field
                  const Text('Username').semiBold(),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _usernameController,
                    placeholder: const Text('Enter your username'),
                    features: [
                      InputFeature.leading(
                          const Icon(LucideIcons.user, size: 18)),
                    ],
                    onChanged: (_) {
                      if (_usernameError != null) {
                        setState(() => _usernameError = null);
                      }
                    },
                  ),
                  if (_usernameError != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      _usernameError!,
                      style: TextStyle(
                        fontSize: 14,
                        color: destructiveColor,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  // Access Key field
                  const Text('Access Key').semiBold(),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _accessKeyController,
                    placeholder: const Text('Enter your access key'),
                    obscureText: _obscurePassword,
                    features: [
                      InputFeature.leading(
                          const Icon(LucideIcons.lock, size: 18)),
                      InputFeature.passwordToggle(),
                    ],
                    onChanged: (_) {
                      if (_accessKeyError != null) {
                        setState(() => _accessKeyError = null);
                      }
                    },
                  ),
                  if (_accessKeyError != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      _accessKeyError!,
                      style: TextStyle(
                        fontSize: 14,
                        color: destructiveColor,
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  // Sign In button
                  PrimaryButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    child: _isLoading
                        ? const CircularProgressIndicator(size: 20)
                        : const Text('Sign In'),
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
