import 'package:dio/dio.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/core/services/auth_service.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: "https://pami-backend-production-fde3.up.railway.app",
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await AuthService.getAccessToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.response != null && e.response?.data is Map<String, dynamic>) {
            final data = e.response!.data as Map<String, dynamic>;
            final title = data['title'] ?? 'Error';
            final detail = data['detail'] ?? 'Ocurrió un error inesperado';
            final status = data['status'] ?? e.response!.statusCode;
            final code = data['errorCode'] ?? '';

            // Lanzamos directamente la excepción limpia
            return handler.reject(
              DioException(
                requestOptions: e.requestOptions,
                response: e.response,
                error: ServerException(
                  title: title.toString(),
                  detail: detail.toString(),
                  status:
                      status is int
                          ? status
                          : int.tryParse(status.toString()) ?? 0,
                  errorCode: code.toString(),
                ),
                type: DioExceptionType.badResponse,
              ),
            );
          }

          // Error de red genérico
          return handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              error: ServerException(
                title: 'Error de red',
                detail: e.message ?? 'Error desconocido en la conexión',
                status: e.response?.statusCode ?? 0,
                errorCode: 'Network.Error',
              ),
              type: DioExceptionType.connectionError,
            ),
          );
        },
      ),
    );
  }
}
