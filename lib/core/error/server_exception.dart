class ServerException implements Exception {
  final String title;
  final String detail;
  final int status;
  final String errorCode;

  ServerException({
    required this.title,
    required this.detail,
    required this.status,
    required this.errorCode,
  });

  @override
  String toString() => '$title ($status): $detail';
}
