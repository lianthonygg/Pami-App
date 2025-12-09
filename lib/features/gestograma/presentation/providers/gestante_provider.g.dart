// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gestante_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gestanteByCi)
const gestanteByCiProvider = GestanteByCiFamily._();

final class GestanteByCiProvider
    extends
        $FunctionalProvider<
          AsyncValue<PersonaWithGestanteDetail?>,
          PersonaWithGestanteDetail?,
          FutureOr<PersonaWithGestanteDetail?>
        >
    with
        $FutureModifier<PersonaWithGestanteDetail?>,
        $FutureProvider<PersonaWithGestanteDetail?> {
  const GestanteByCiProvider._({
    required GestanteByCiFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'gestanteByCiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gestanteByCiHash();

  @override
  String toString() {
    return r'gestanteByCiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PersonaWithGestanteDetail?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PersonaWithGestanteDetail?> create(Ref ref) {
    final argument = this.argument as String;
    return gestanteByCi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GestanteByCiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gestanteByCiHash() => r'd143d9033e84dcc662d277b2f529ac7c3a87c6dc';

final class GestanteByCiFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PersonaWithGestanteDetail?>,
          String
        > {
  const GestanteByCiFamily._()
    : super(
        retry: null,
        name: r'gestanteByCiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GestanteByCiProvider call(String ci) =>
      GestanteByCiProvider._(argument: ci, from: this);

  @override
  String toString() => r'gestanteByCiProvider';
}

@ProviderFor(tryGestanteByCi)
const tryGestanteByCiProvider = TryGestanteByCiFamily._();

final class TryGestanteByCiProvider
    extends
        $FunctionalProvider<AsyncValue<Persona?>, Persona?, FutureOr<Persona?>>
    with $FutureModifier<Persona?>, $FutureProvider<Persona?> {
  const TryGestanteByCiProvider._({
    required TryGestanteByCiFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'tryGestanteByCiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tryGestanteByCiHash();

  @override
  String toString() {
    return r'tryGestanteByCiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Persona?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Persona?> create(Ref ref) {
    final argument = this.argument as String?;
    return tryGestanteByCi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TryGestanteByCiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tryGestanteByCiHash() => r'933fe0059d6159df8ba15bd0d444bf58e96958dc';

final class TryGestanteByCiFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Persona?>, String?> {
  const TryGestanteByCiFamily._()
    : super(
        retry: null,
        name: r'tryGestanteByCiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TryGestanteByCiProvider call(String? ci) =>
      TryGestanteByCiProvider._(argument: ci, from: this);

  @override
  String toString() => r'tryGestanteByCiProvider';
}

@ProviderFor(GestanteForm)
const gestanteFormProvider = GestanteFormProvider._();

final class GestanteFormProvider
    extends
        $NotifierProvider<
          GestanteForm,
          ({
            String abortos,
            String antPPretermino,
            String antPp,
            String cesareas,
            int clasificacionRiesgo,
            String fechaCaptacion,
            String fechaProbableParto,
            String fum,
            String gestaciones,
            String imc,
            String observaciones,
            String partos,
            String rciu,
            String tgCaptacion,
          })
        > {
  const GestanteFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gestanteFormProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gestanteFormHash();

  @$internal
  @override
  GestanteForm create() => GestanteForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({
      String abortos,
      String antPPretermino,
      String antPp,
      String cesareas,
      int clasificacionRiesgo,
      String fechaCaptacion,
      String fechaProbableParto,
      String fum,
      String gestaciones,
      String imc,
      String observaciones,
      String partos,
      String rciu,
      String tgCaptacion,
    })
    value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<
        ({
          String abortos,
          String antPPretermino,
          String antPp,
          String cesareas,
          int clasificacionRiesgo,
          String fechaCaptacion,
          String fechaProbableParto,
          String fum,
          String gestaciones,
          String imc,
          String observaciones,
          String partos,
          String rciu,
          String tgCaptacion,
        })
      >(value),
    );
  }
}

String _$gestanteFormHash() => r'acb3114021f23783ee0081033e37c97000fd730d';

abstract class _$GestanteForm
    extends
        $Notifier<
          ({
            String abortos,
            String antPPretermino,
            String antPp,
            String cesareas,
            int clasificacionRiesgo,
            String fechaCaptacion,
            String fechaProbableParto,
            String fum,
            String gestaciones,
            String imc,
            String observaciones,
            String partos,
            String rciu,
            String tgCaptacion,
          })
        > {
  ({
    String abortos,
    String antPPretermino,
    String antPp,
    String cesareas,
    int clasificacionRiesgo,
    String fechaCaptacion,
    String fechaProbableParto,
    String fum,
    String gestaciones,
    String imc,
    String observaciones,
    String partos,
    String rciu,
    String tgCaptacion,
  })
  build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              ({
                String abortos,
                String antPPretermino,
                String antPp,
                String cesareas,
                int clasificacionRiesgo,
                String fechaCaptacion,
                String fechaProbableParto,
                String fum,
                String gestaciones,
                String imc,
                String observaciones,
                String partos,
                String rciu,
                String tgCaptacion,
              }),
              ({
                String abortos,
                String antPPretermino,
                String antPp,
                String cesareas,
                int clasificacionRiesgo,
                String fechaCaptacion,
                String fechaProbableParto,
                String fum,
                String gestaciones,
                String imc,
                String observaciones,
                String partos,
                String rciu,
                String tgCaptacion,
              })
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({
                  String abortos,
                  String antPPretermino,
                  String antPp,
                  String cesareas,
                  int clasificacionRiesgo,
                  String fechaCaptacion,
                  String fechaProbableParto,
                  String fum,
                  String gestaciones,
                  String imc,
                  String observaciones,
                  String partos,
                  String rciu,
                  String tgCaptacion,
                }),
                ({
                  String abortos,
                  String antPPretermino,
                  String antPp,
                  String cesareas,
                  int clasificacionRiesgo,
                  String fechaCaptacion,
                  String fechaProbableParto,
                  String fum,
                  String gestaciones,
                  String imc,
                  String observaciones,
                  String partos,
                  String rciu,
                  String tgCaptacion,
                })
              >,
              ({
                String abortos,
                String antPPretermino,
                String antPp,
                String cesareas,
                int clasificacionRiesgo,
                String fechaCaptacion,
                String fechaProbableParto,
                String fum,
                String gestaciones,
                String imc,
                String observaciones,
                String partos,
                String rciu,
                String tgCaptacion,
              }),
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
