import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dio_client.dart';

part 'dio_provider.g.dart';

@riverpod
DioClient dioClient(Ref ref) {
  return DioClient();
}

@riverpod
Dio dio(Ref ref) {
  final dio = ref.watch(dioClientProvider).dio;
  return dio;
}
