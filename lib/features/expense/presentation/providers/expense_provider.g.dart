// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseRemoteDataSourceHash() =>
    r'7212316a97917c28d59ffce42faa1ab868a10e5f';

/// Provides the ExpenseRemoteDataSource.
///
/// Copied from [expenseRemoteDataSource].
@ProviderFor(expenseRemoteDataSource)
final expenseRemoteDataSourceProvider =
    AutoDisposeProvider<ExpenseRemoteDataSource>.internal(
  expenseRemoteDataSource,
  name: r'expenseRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpenseRemoteDataSourceRef
    = AutoDisposeProviderRef<ExpenseRemoteDataSource>;
String _$expenseRepositoryHash() => r'e2f800c15d1e01b4e0c9519e54398e5e21ec1fd3';

/// Provides the ExpenseRepository.
///
/// Copied from [expenseRepository].
@ProviderFor(expenseRepository)
final expenseRepositoryProvider =
    AutoDisposeProvider<ExpenseRepository>.internal(
  expenseRepository,
  name: r'expenseRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpenseRepositoryRef = AutoDisposeProviderRef<ExpenseRepository>;
String _$expenseDateNotifierHash() =>
    r'dcbbfe9f2c1bbe7f6f9a0e1e3cd4cb0acf3c3bb8';

/// State for the current expense date filter.
///
/// Copied from [ExpenseDateNotifier].
@ProviderFor(ExpenseDateNotifier)
final expenseDateNotifierProvider =
    AutoDisposeNotifierProvider<ExpenseDateNotifier, DateTime>.internal(
  ExpenseDateNotifier.new,
  name: r'expenseDateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseDateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExpenseDateNotifier = AutoDisposeNotifier<DateTime>;
String _$expenseNotifierHash() => r'ee1a998d4e4c47f77599ce888376dbb57896dab6';

/// Notifier for managing expense state.
///
/// Copied from [ExpenseNotifier].
@ProviderFor(ExpenseNotifier)
final expenseNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ExpenseNotifier, ExpenseState>.internal(
  ExpenseNotifier.new,
  name: r'expenseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExpenseNotifier = AutoDisposeAsyncNotifier<ExpenseState>;
String _$expenseItemsEditorHash() =>
    r'795fd3371e2b47642d709a843f17ebe7a326bcc9';

/// Temporary items being edited.
///
/// Copied from [ExpenseItemsEditor].
@ProviderFor(ExpenseItemsEditor)
final expenseItemsEditorProvider = AutoDisposeNotifierProvider<
    ExpenseItemsEditor, List<ExpenseItemInput>>.internal(
  ExpenseItemsEditor.new,
  name: r'expenseItemsEditorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expenseItemsEditorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExpenseItemsEditor = AutoDisposeNotifier<List<ExpenseItemInput>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
