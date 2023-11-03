import 'package:get_it/get_it.dart';
import 'package:nobuzz_app_plus/data/datasource/remote/get_times_remote_datasource.dart';
import 'package:nobuzz_app_plus/data/datasource/remote/get_times_remote_datasource_imp.dart';
import 'package:nobuzz_app_plus/data/http/client_http.dart';
import 'package:nobuzz_app_plus/data/http/client_http_imp.dart';
import 'package:nobuzz_app_plus/data/repositories/get_times_repository_imp.dart';
import 'package:nobuzz_app_plus/domain/repositories/get_times_repository.dart';
import 'package:nobuzz_app_plus/domain/usecases/get_times_usecase/get_times_usecase.dart';
import 'package:nobuzz_app_plus/domain/usecases/get_times_usecase/get_times_usecase_imp.dart';
import 'package:nobuzz_app_plus/presentation/controllers/time_controller/time_controller.dart';

class Inject {
  
  static init() {
    GetIt getIt = GetIt.instance;

    // Client Http
    getIt.registerLazySingleton<ClientHttp>(() => ClientHttpImp());

    // Datasources
    // Remote
    getIt.registerLazySingleton<GetTimesRemoteDatasource>(() => GetTimesRemoteDatasourceImp(getIt()));

    // Repositories
    getIt.registerLazySingleton<GetTimesRepository>(() => GetTimesRepositoryImp(getIt()));

    // Usecase 
    getIt.registerLazySingleton<GetTimesUsecase>(() => GetTimesUsecaseImp(getIt()));

    //Controller
    getIt.registerLazySingleton<TimeController>(() => TimeController(getIt()));
  }
}