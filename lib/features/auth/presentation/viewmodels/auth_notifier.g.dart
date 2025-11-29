// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthNotifier)
const authProvider = AuthNotifierProvider._();

final class AuthNotifierProvider
    extends $NotifierProvider<AuthNotifier, AuthNotifierState> {
  const AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthNotifierState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthNotifierState>(value),
    );
  }
}

String _$authNotifierHash() => r'f046ab69264d0b320c999f174044ba49df2c7193';

abstract class _$AuthNotifier extends $Notifier<AuthNotifierState> {
  AuthNotifierState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AuthNotifierState, AuthNotifierState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthNotifierState, AuthNotifierState>,
              AuthNotifierState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
