
import '../enums.dart';

class RequestResult<T> {
  final String? errorMessage;
  final int? statusCode;
  final T? data;
  final RequestState requestState;

  RequestResult({
    required this.requestState,
    this.errorMessage,
    this.statusCode,
    this.data,
  });
}
