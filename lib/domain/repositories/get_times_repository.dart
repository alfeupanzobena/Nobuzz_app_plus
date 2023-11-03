import 'package:dartz/dartz.dart';
import 'package:nobuzz_app_plus/common/exceptions/server_exception.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';

abstract class GetTimesRepository {
  Future<Either<ServerException, List<TimeEntity>>> call();
}