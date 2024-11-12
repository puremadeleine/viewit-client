class ApiResponse<T> {
  T? data;
  String? message;

  @override
  String toString() {
    return "Message : $message \n Data : $data";
  }
}
