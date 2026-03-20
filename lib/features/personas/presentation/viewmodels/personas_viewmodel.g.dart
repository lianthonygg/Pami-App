// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personas_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PersonasViewModel)
const personasViewModelProvider = PersonasViewModelProvider._();

final class PersonasViewModelProvider
    extends $NotifierProvider<PersonasViewModel, PersonasState> {
  const PersonasViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personasViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personasViewModelHash();

  @$internal
  @override
  PersonasViewModel create() => PersonasViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonasState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonasState>(value),
    );
  }
}

String _$personasViewModelHash() => r'10855c23c5d28dfd7ef5bccf9d37f792c67806d0';

abstract class _$PersonasViewModel extends $Notifier<PersonasState> {
  PersonasState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PersonasState, PersonasState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PersonasState, PersonasState>,
              PersonasState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
