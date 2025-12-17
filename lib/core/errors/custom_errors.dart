class CustomError implements Exception {
  final String message;

  const CustomError(this.message);

  @override
  String toString() => 'CustomError: $message';
}

class NetworkError extends CustomError {
  const NetworkError(super.message);
}

class ServerError extends CustomError {
  const ServerError(super.message);
}

class ValidationError extends CustomError {
  const ValidationError(super.message);
}
