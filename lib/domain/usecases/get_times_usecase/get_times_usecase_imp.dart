import 'package:dartz/dartz.dart';
import 'package:nobuzz_app_plus/common/exceptions/server_exception.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';
import 'package:nobuzz_app_plus/domain/repositories/get_times_repository.dart';
import 'package:nobuzz_app_plus/domain/usecases/get_times_usecase/get_times_usecase.dart';

class GetTimesUsecaseImp implements GetTimesUsecase {
  final GetTimesRepository repository;
  GetTimesUsecaseImp(this.repository);

  @override
  Future<Either<ServerException, List<TimeEntity>>> call() => repository() ;
}