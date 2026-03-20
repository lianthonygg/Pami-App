// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gestantes_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GestantesViewModel)
const gestantesViewModelProvider = GestantesViewModelProvider._();

final class GestantesViewModelProvider
    extends $NotifierProvider<GestantesViewModel, GestantesState> {
  const GestantesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gestantesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gestantesViewModelHash();

  @$internal
  @override
  GestantesViewModel create() => GestantesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GestantesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GestantesState>(value),
    );
  }
}

String _$gestantesViewModelHash() =>
    r'8a21622cc54d829f5df8619ae3dfe2de4adfd72b';

abstract class _$GestantesViewModel extends $Notifier<GestantesState> {
  GestantesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GestantesState, GestantesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GestantesState, GestantesState>,
              GestantesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
