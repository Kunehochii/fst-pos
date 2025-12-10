// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sheetRemoteDataSourceHash() =>
    r'9390986e81a1e7ccfa2e7e5bc6a5f83090dc63b9';

/// Provides the SheetRemoteDataSource.
///
/// Copied from [sheetRemoteDataSource].
@ProviderFor(sheetRemoteDataSource)
final sheetRemoteDataSourceProvider =
    AutoDisposeProvider<SheetRemoteDataSource>.internal(
  sheetRemoteDataSource,
  name: r'sheetRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sheetRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SheetRemoteDataSourceRef
    = AutoDisposeProviderRef<SheetRemoteDataSource>;
String _$sheetLocalDataSourceHash() =>
    r'08145b1b1e55bf984bce09f38c1abf3435084af5';

/// Provides the SheetLocalDataSource.
///
/// Copied from [sheetLocalDataSource].
@ProviderFor(sheetLocalDataSource)
final sheetLocalDataSourceProvider =
    AutoDisposeProvider<SheetLocalDataSource>.internal(
  sheetLocalDataSource,
  name: r'sheetLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sheetLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SheetLocalDataSourceRef = AutoDisposeProviderRef<SheetLocalDataSource>;
String _$sheetRepositoryHash() => r'6311e86610478267790f2251f7b79c36016330f3';

/// Provides the SheetRepository.
///
/// Requires authenticated cashier - throws if not logged in.
///
/// Copied from [sheetRepository].
@ProviderFor(sheetRepository)
final sheetRepositoryProvider = AutoDisposeProvider<SheetRepository>.internal(
  sheetRepository,
  name: r'sheetRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sheetRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SheetRepositoryRef = AutoDisposeProviderRef<SheetRepository>;
String _$sheetByTypeHash() => r'3a73fa996c777aae42950d29c72ed9823e094031';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Generic provider to get sheet by type.
///
/// Copied from [sheetByType].
@ProviderFor(sheetByType)
const sheetByTypeProvider = SheetByTypeFamily();

/// Generic provider to get sheet by type.
///
/// Copied from [sheetByType].
class SheetByTypeFamily extends Family<AsyncValue<Sheet?>> {
  /// Generic provider to get sheet by type.
  ///
  /// Copied from [sheetByType].
  const SheetByTypeFamily();

  /// Generic provider to get sheet by type.
  ///
  /// Copied from [sheetByType].
  SheetByTypeProvider call(
    SheetType sheetType,
  ) {
    return SheetByTypeProvider(
      sheetType,
    );
  }

  @override
  SheetByTypeProvider getProviderOverride(
    covariant SheetByTypeProvider provider,
  ) {
    return call(
      provider.sheetType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sheetByTypeProvider';
}

/// Generic provider to get sheet by type.
///
/// Copied from [sheetByType].
class SheetByTypeProvider extends AutoDisposeFutureProvider<Sheet?> {
  /// Generic provider to get sheet by type.
  ///
  /// Copied from [sheetByType].
  SheetByTypeProvider(
    SheetType sheetType,
  ) : this._internal(
          (ref) => sheetByType(
            ref as SheetByTypeRef,
            sheetType,
          ),
          from: sheetByTypeProvider,
          name: r'sheetByTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sheetByTypeHash,
          dependencies: SheetByTypeFamily._dependencies,
          allTransitiveDependencies:
              SheetByTypeFamily._allTransitiveDependencies,
          sheetType: sheetType,
        );

  SheetByTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sheetType,
  }) : super.internal();

  final SheetType sheetType;

  @override
  Override overrideWith(
    FutureOr<Sheet?> Function(SheetByTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SheetByTypeProvider._internal(
        (ref) => create(ref as SheetByTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sheetType: sheetType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Sheet?> createElement() {
    return _SheetByTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SheetByTypeProvider && other.sheetType == sheetType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sheetType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SheetByTypeRef on AutoDisposeFutureProviderRef<Sheet?> {
  /// The parameter `sheetType` of this provider.
  SheetType get sheetType;
}

class _SheetByTypeProviderElement
    extends AutoDisposeFutureProviderElement<Sheet?> with SheetByTypeRef {
  _SheetByTypeProviderElement(super.provider);

  @override
  SheetType get sheetType => (origin as SheetByTypeProvider).sheetType;
}

String _$kahonSheetNotifierHash() =>
    r'9056ecd437d5f248ac4f1112214329e4d9a2727b';

/// Manages the Kahon sheet state.
///
/// Copied from [KahonSheetNotifier].
@ProviderFor(KahonSheetNotifier)
final kahonSheetNotifierProvider =
    AutoDisposeAsyncNotifierProvider<KahonSheetNotifier, SheetState>.internal(
  KahonSheetNotifier.new,
  name: r'kahonSheetNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$kahonSheetNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$KahonSheetNotifier = AutoDisposeAsyncNotifier<SheetState>;
String _$inventorySheetNotifierHash() =>
    r'cb54062ffdffe8bcb4606f7fe1874552069836ce';

/// Manages the Inventory sheet state.
///
/// Copied from [InventorySheetNotifier].
@ProviderFor(InventorySheetNotifier)
final inventorySheetNotifierProvider = AutoDisposeAsyncNotifierProvider<
    InventorySheetNotifier, SheetState>.internal(
  InventorySheetNotifier.new,
  name: r'inventorySheetNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inventorySheetNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InventorySheetNotifier = AutoDisposeAsyncNotifier<SheetState>;
String _$pendingChangesNotifierHash() =>
    r'eda6785840ee7beb94439a13a5609d76bb7b7dff';

/// Manages pending cell changes.
///
/// Copied from [PendingChangesNotifier].
@ProviderFor(PendingChangesNotifier)
final pendingChangesNotifierProvider = AutoDisposeNotifierProvider<
    PendingChangesNotifier, Map<String, PendingCellChange>>.internal(
  PendingChangesNotifier.new,
  name: r'pendingChangesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pendingChangesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PendingChangesNotifier
    = AutoDisposeNotifier<Map<String, PendingCellChange>>;
String _$selectedCellNotifierHash() =>
    r'44307bbf2528f7bd9e624281df01acb1bfc75591';

/// Manages selected cell state.
///
/// Copied from [SelectedCellNotifier].
@ProviderFor(SelectedCellNotifier)
final selectedCellNotifierProvider =
    AutoDisposeNotifierProvider<SelectedCellNotifier, SelectedCell?>.internal(
  SelectedCellNotifier.new,
  name: r'selectedCellNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCellNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCellNotifier = AutoDisposeNotifier<SelectedCell?>;
String _$editingCellNotifierHash() =>
    r'cfaa9dbfde7c41db2dc4faf4ba43ee7416d7e888';

/// Manages editing cell state.
///
/// Copied from [EditingCellNotifier].
@ProviderFor(EditingCellNotifier)
final editingCellNotifierProvider =
    AutoDisposeNotifierProvider<EditingCellNotifier, SelectedCell?>.internal(
  EditingCellNotifier.new,
  name: r'editingCellNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editingCellNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditingCellNotifier = AutoDisposeNotifier<SelectedCell?>;
String _$selectedRowsNotifierHash() =>
    r'f5aec6dd717b4f97d53e0d41c3e7e41d79184dff';

/// Manages selected rows for bulk operations.
///
/// Copied from [SelectedRowsNotifier].
@ProviderFor(SelectedRowsNotifier)
final selectedRowsNotifierProvider =
    AutoDisposeNotifierProvider<SelectedRowsNotifier, Set<String>>.internal(
  SelectedRowsNotifier.new,
  name: r'selectedRowsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedRowsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedRowsNotifier = AutoDisposeNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
