import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:nobuzz_app_plus/common/exceptions/server_exception.dart';
import 'package:nobuzz_app_plus/data/datasource/remote/get_times_remote_datasource.dart';
import 'package:nobuzz_app_plus/data/dtos/server_exception_dto.dart';
import 'package:nobuzz_app_plus/data/dtos/time_dto.dart';
import 'package:nobuzz_app_plus/data/http/client_http.dart';

class GetTimesRemoteDatasourceImp implements GetTimesRemoteDatasource {
  final ClientHttp _clientHttp;

  GetTimesRemoteDatasourceImp(this._clientHttp);

  @override
  Future<Either<ServerException, List<TimeDto>>> call() async {
    final response = await _clientHttp.post(
      route: "/parse/functions/informacoes_do_tempo",
      headers: {
        "X-Parse-Application-Id": "nAX5VLA1WnL3qkzuYnlh4tzUqS9NJuKGL13L4vas",
        "X-Parse-REST-API-Key": "3Q8wzFGU6isxalfOyagYkz2bu0lCTcrtgJ7Q4iD7",
        "X-Parse-Revocable-Session": "1",
        "Content-Length": "0"
      },
    );

    if (response.statusCode == 200) {
      return Right(List<TimeDto>.from(json
          .decode(response.body)["result"]["estados"]
          .map((x) => TimeDto.fromJson(x))));
    } else {
      return Left(ServerExceptionDto.fromJson(json.decode(response.body))
          as ServerException);
    }
  }
}
