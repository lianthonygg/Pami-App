// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puerpera_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PuerperaViewModel)
const puerperaViewModelProvider = PuerperaViewModelProvider._();

final class PuerperaViewModelProvider
    extends $NotifierProvider<PuerperaViewModel, PuerperasState> {
  const PuerperaViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'puerperaViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$puerperaViewModelHash();

  @$internal
  @override
  PuerperaViewModel create() => PuerperaViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PuerperasState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PuerperasState>(value),
    );
  }
}

String _$puerperaViewModelHash() => r'da373ce8eecdcf4f93435688bd6fe46db2c6298f';

abstract class _$PuerperaViewModel extends $Notifier<PuerperasState> {
  PuerperasState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PuerperasState, PuerperasState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PuerperasState, PuerperasState>,
              PuerperasState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
