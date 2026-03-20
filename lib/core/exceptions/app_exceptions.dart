class AppExceptions implements Exception {
  final String _message;
  final String _prefix;
  AppExceptions(this._message, this._prefix);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
    : super(
        message ?? 'No internet connection available.',
        'No Internet Exception: ',
      );
}

class UnauthorisedException extends AppExceptions {
  UnauthorisedException([String? message])
    : super(message ?? 'Unauthorized access.', 'Unauthorized Exception: ');
}

class RequestException extends AppExceptions {
  RequestException([String? message])
    : super(message ?? 'Request failed.', 'Request Exception: ');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
    : super(message ?? 'Failed to fetch data.', 'Fetch Data Exception: ');
}
