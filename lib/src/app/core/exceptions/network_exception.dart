
class PrimaryServerException implements Exception {
  final String error;
  final String message;
  final int code;

  PrimaryServerException({
    required this.error,
    required this.code,
    required this.message,
  });



  factory PrimaryServerException.fromMap(Map<String, dynamic> map) {
    return PrimaryServerException(
      error: map['error'] ?? '',
      message: map['message'] ?? '',
      code: map['code']?.toInt() ?? 0,
    );
  }


}
