import 'package:nobuzz_app_plus/common/exceptions/server_exception.dart';

class ServerExceptionDto extends ServerException {
  ServerExceptionDto({required int code, required String message}) : super(code: code, message: message);

  factory ServerExceptionDto.fromJson(dynamic json) => ServerExceptionDto(
    code: json["status"] ?? 0, 
    message: json["message"] ?? ""
  );
}