// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregestantes_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PregestantesViewModel)
const pregestantesViewModelProvider = PregestantesViewModelProvider._();

final class PregestantesViewModelProvider
    extends $NotifierProvider<PregestantesViewModel, PregestantesState> {
  const PregestantesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pregestantesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pregestantesViewModelHash();

  @$internal
  @override
  PregestantesViewModel create() => PregestantesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PregestantesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PregestantesState>(value),
    );
  }
}

String _$pregestantesViewModelHash() =>
    r'd33b4ad1cd06db3897952445da698e7ddfeb6845';

abstract class _$PregestantesViewModel extends $Notifier<PregestantesState> {
  PregestantesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PregestantesState, PregestantesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PregestantesState, PregestantesState>,
              PregestantesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
