// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_listener_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncListener)
const syncListenerProvider = SyncListenerProvider._();

final class SyncListenerProvider extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  const SyncListenerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncListenerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncListenerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return syncListener(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$syncListenerHash() => r'd388b8dff80f439c9741d80448a96ea959533d27';
