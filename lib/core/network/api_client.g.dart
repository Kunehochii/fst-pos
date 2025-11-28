// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiClientHash() => r'1ac59a27834171d2e313da3eb4d767d131c6f82c';

/// Provides the configured Dio HTTP client.
///
/// Features:
/// - Base URL configuration from environment
/// - JWT token authentication via interceptor
/// - Request/Response logging in debug mode
/// - Timeout configuration
///
/// Usage:
/// ```dart
/// final dio = ref.watch(apiClientProvider);
/// final response = await dio.get('/users');
/// ```
///
/// Copied from [apiClient].
@ProviderFor(apiClient)
final apiClientProvider = AutoDisposeProvider<Dio>.internal(
  apiClient,
  name: r'apiClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiClientRef = AutoDisposeProviderRef<Dio>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
