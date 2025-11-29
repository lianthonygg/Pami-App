// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregestantes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Ci)
const ciProvider = CiProvider._();

final class CiProvider extends $NotifierProvider<Ci, String> {
  const CiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ciProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ciHash();

  @$internal
  @override
  Ci create() => Ci();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$ciHash() => r'e34bd98081b3855249addb07eed69d63a8c21343';

abstract class _$Ci extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Observaciones)
const observacionesProvider = ObservacionesProvider._();

final class ObservacionesProvider
    extends $NotifierProvider<Observaciones, String> {
  const ObservacionesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'observacionesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$observacionesHash();

  @$internal
  @override
  Observaciones create() => Observaciones();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$observacionesHash() => r'6a387355ff43cc218772947b3ad94d93ebe1fef2';

abstract class _$Observaciones extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
