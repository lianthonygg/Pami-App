import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pregestantes_provider.g.dart';

@Riverpod(keepAlive: false)
class Ci extends _$Ci {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class Observaciones extends _$Observaciones {
  @override
  String build() => '';

  void set(String value) => state = value;
}
