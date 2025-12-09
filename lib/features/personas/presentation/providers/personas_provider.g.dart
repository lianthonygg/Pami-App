// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personas_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(personaByCi)
const personaByCiProvider = PersonaByCiFamily._();

final class PersonaByCiProvider
    extends
        $FunctionalProvider<
          AsyncValue<PersonaConCdrYCircunscripcion?>,
          PersonaConCdrYCircunscripcion?,
          FutureOr<PersonaConCdrYCircunscripcion?>
        >
    with
        $FutureModifier<PersonaConCdrYCircunscripcion?>,
        $FutureProvider<PersonaConCdrYCircunscripcion?> {
  const PersonaByCiProvider._({
    required PersonaByCiFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'personaByCiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$personaByCiHash();

  @override
  String toString() {
    return r'personaByCiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PersonaConCdrYCircunscripcion?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PersonaConCdrYCircunscripcion?> create(Ref ref) {
    final argument = this.argument as String?;
    return personaByCi(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PersonaByCiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$personaByCiHash() => r'90993fa18cb62526ad46ff97df2577cbd0821990';

final class PersonaByCiFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<PersonaConCdrYCircunscripcion?>,
          String?
        > {
  const PersonaByCiFamily._()
    : super(
        retry: null,
        name: r'personaByCiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PersonaByCiProvider call(String? ci) =>
      PersonaByCiProvider._(argument: ci, from: this);

  @override
  String toString() => r'personaByCiProvider';
}
