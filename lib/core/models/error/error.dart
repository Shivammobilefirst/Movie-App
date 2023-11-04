import 'dart:convert';

class ErrorModel {
  ErrorModel({
    required this.statusCode,
    required this.statusMessage,
  });

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      statusCode: (map['statusCode'] as int?) ?? map['code'] as int,
      statusMessage: getErrorMessage(map),
    );
  }

  final int statusCode;
  final String statusMessage;

  @override
  String toString() =>
      'ErrorModel(statusCode: $statusCode, statusMessage: $statusMessage)';

  ErrorModel copyWith({
    int? statusCode,
    String? statusMessage,
  }) {
    return ErrorModel(
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }
}

String getErrorMessage(Map<String, dynamic> map) {
  var error = (map['error'] as String?) ?? (map['message'] as String);
  if (map.containsKey('desc') &&
      (map['desc'] is String) &&
      (map['desc'] as String).isNotEmpty) {
    error = '$error: ${map['desc'] as String}';
  }
  return error;
}
