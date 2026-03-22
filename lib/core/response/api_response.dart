import '../utils/enum.dart';

class ApiResponse<T> {
  final GetApiStatus status;
  final T? data;
  final String? message;

  const ApiResponse._({required this.status, this.data, this.message});

  const ApiResponse.loading() : this._(status: GetApiStatus.loading);

  const ApiResponse.completed(T data)
    : this._(status: GetApiStatus.complete, data: data);

  const ApiResponse.error(String message)
    : this._(status: GetApiStatus.error, message: message);

  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}
