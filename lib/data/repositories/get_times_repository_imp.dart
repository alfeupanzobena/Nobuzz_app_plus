import 'package:dartz/dartz.dart';
import 'package:nobuzz_app_plus/common/exceptions/server_exception.dart';
import 'package:nobuzz_app_plus/data/datasource/remote/get_times_remote_datasource.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';
import 'package:nobuzz_app_plus/domain/repositories/get_times_repository.dart';

class GetTimesRepositoryImp implements GetTimesRepository {
  final GetTimesRemoteDatasource datasource;
  GetTimesRepositoryImp(this.datasource);

  @override
  Future<Either<ServerException, List<TimeEntity>>> call() => datasource();
  
}