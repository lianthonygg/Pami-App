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
    extends $AsyncNotifierProvider<AuthNotifier, AuthNotifierState> {
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
}

String _$authNotifierHash() => r'a8a325ca42230e5b1a06f46232fd6f3624e1e492';

abstract class _$AuthNotifier extends $AsyncNotifier<AuthNotifierState> {
  FutureOr<AuthNotifierState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<AuthNotifierState>, AuthNotifierState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthNotifierState>, AuthNotifierState>,
              AsyncValue<AuthNotifierState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(authRouterState)
const authRouterStateProvider = AuthRouterStateProvider._();

final class AuthRouterStateProvider
    extends
        $FunctionalProvider<AuthRouterState, AuthRouterState, AuthRouterState>
    with $Provider<AuthRouterState> {
  const AuthRouterStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRouterStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRouterStateHash();

  @$internal
  @override
  $ProviderElement<AuthRouterState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRouterState create(Ref ref) {
    return authRouterState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRouterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRouterState>(value),
    );
  }
}

String _$authRouterStateHash() => r'35dd100a9f3d350d662820aac787755a2e6c9188';
