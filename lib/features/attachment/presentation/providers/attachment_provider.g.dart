// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attachmentRemoteDataSourceHash() =>
    r'b2938763bfedf3d18601a6ff2d7bb84a879752d8';

/// Provides the AttachmentRemoteDataSource.
///
/// Copied from [attachmentRemoteDataSource].
@ProviderFor(attachmentRemoteDataSource)
final attachmentRemoteDataSourceProvider =
    AutoDisposeProvider<AttachmentRemoteDataSource>.internal(
  attachmentRemoteDataSource,
  name: r'attachmentRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attachmentRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AttachmentRemoteDataSourceRef
    = AutoDisposeProviderRef<AttachmentRemoteDataSource>;
String _$attachmentRepositoryHash() =>
    r'c7b71150fa9169fa9a662927a268a2c87a848cd2';

/// Provides the AttachmentRepository.
///
/// Copied from [attachmentRepository].
@ProviderFor(attachmentRepository)
final attachmentRepositoryProvider =
    AutoDisposeProvider<AttachmentRepository>.internal(
  attachmentRepository,
  name: r'attachmentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attachmentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AttachmentRepositoryRef = AutoDisposeProviderRef<AttachmentRepository>;
String _$imagePickerHash() => r'7740c09b2d6b395ce466f1b72b93b31db7bfd740';

/// Provides ImagePicker instance.
///
/// Copied from [imagePicker].
@ProviderFor(imagePicker)
final imagePickerProvider = AutoDisposeProvider<ImagePicker>.internal(
  imagePicker,
  name: r'imagePickerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$imagePickerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImagePickerRef = AutoDisposeProviderRef<ImagePicker>;
String _$attachmentDateNotifierHash() =>
    r'd9a8465f2ea2b51f16e1c0aa70cad617838ec4c1';

/// State for the current attachment date filter.
///
/// Copied from [AttachmentDateNotifier].
@ProviderFor(AttachmentDateNotifier)
final attachmentDateNotifierProvider =
    AutoDisposeNotifierProvider<AttachmentDateNotifier, DateTime>.internal(
  AttachmentDateNotifier.new,
  name: r'attachmentDateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attachmentDateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AttachmentDateNotifier = AutoDisposeNotifier<DateTime>;
String _$attachmentTypeFilterNotifierHash() =>
    r'4a6c1116babaf2dc34332e8186d6a1a876b7aad9';

/// State for the current attachment type filter.
///
/// Copied from [AttachmentTypeFilterNotifier].
@ProviderFor(AttachmentTypeFilterNotifier)
final attachmentTypeFilterNotifierProvider = AutoDisposeNotifierProvider<
    AttachmentTypeFilterNotifier, AttachmentType?>.internal(
  AttachmentTypeFilterNotifier.new,
  name: r'attachmentTypeFilterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attachmentTypeFilterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AttachmentTypeFilterNotifier = AutoDisposeNotifier<AttachmentType?>;
String _$attachmentNotifierHash() =>
    r'725d15d5b509e0bb7e8ea56d8800ad200523c088';

/// Manages attachment state and operations.
///
/// Copied from [AttachmentNotifier].
@ProviderFor(AttachmentNotifier)
final attachmentNotifierProvider = AutoDisposeAsyncNotifierProvider<
    AttachmentNotifier, AttachmentState>.internal(
  AttachmentNotifier.new,
  name: r'attachmentNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attachmentNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AttachmentNotifier = AutoDisposeAsyncNotifier<AttachmentState>;
String _$uploadStateNotifierHash() =>
    r'86ee4e5409bf75c602c912e3ad88deb7959113cb';

/// State for upload operations.
///
/// Copied from [UploadStateNotifier].
@ProviderFor(UploadStateNotifier)
final uploadStateNotifierProvider =
    AutoDisposeNotifierProvider<UploadStateNotifier, bool>.internal(
  UploadStateNotifier.new,
  name: r'uploadStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$uploadStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UploadStateNotifier = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
