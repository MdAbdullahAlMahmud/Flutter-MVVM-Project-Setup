
class AppException implements Exception{

  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return 'AppException{_message: $_message, _prefix: $_prefix}';
  }
}

class FetchException extends AppException{
  FetchException([String? message]):super(message,'Error During Communication');
}

class BadRequestException extends AppException{
  BadRequestException([String? message]):super(message,'Invalid Request');
}


class UnauthorisedException extends AppException{
  UnauthorisedException([String? message]):super(message,'Unauthorised Request');
}



