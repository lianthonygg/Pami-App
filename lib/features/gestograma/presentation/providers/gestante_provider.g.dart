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
