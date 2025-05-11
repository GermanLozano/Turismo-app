class ServerException implements Exception {
  ServerException({required this.message});
  final String message;
}

class LocalException implements Exception {
  LocalException({required this.message});
  final String message;
}
