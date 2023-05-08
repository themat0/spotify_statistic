// ignore_for_file: constant_identifier_names

enum ResponseStatus { SUCCESS, ERROR }

class SafeResponse<T> {
  late final T? data;
  late final dynamic errorResponse;
  late final ResponseStatus status;

  bool get isSuccessful => status == ResponseStatus.SUCCESS;

  T get requiredData => isSuccessful ? data! : throw Exception(errorResponse);

  SafeResponse.success(this.data) {
    status = ResponseStatus.SUCCESS;
    errorResponse = null;
  }

  SafeResponse.error(this.errorResponse) {
    status = ResponseStatus.ERROR;
    data = null;
  }
}

Future<SafeResponse<T>> fetchSafety<T>(Future<T> Function() request) async {
  try {
    final T data = await request();
    return SafeResponse.success(data);
  } catch (errorResponse) {
    return SafeResponse.error(errorResponse);
  }
}
