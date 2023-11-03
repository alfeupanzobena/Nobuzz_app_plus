import 'package:dartz/dartz.dart';
import 'package:nobuzz_app_plus/common/exceptions/server_exception.dart';
import 'package:nobuzz_app_plus/data/dtos/time_dto.dart';

abstract class GetTimesRemoteDatasource {
  Future<Either<ServerException, List<TimeDto>>> call();
}