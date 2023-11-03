import 'package:mobx/mobx.dart';
import 'package:nobuzz_app_plus/common/exceptions/server_exception.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';
import 'package:nobuzz_app_plus/domain/usecases/get_times_usecase/get_times_usecase.dart';

part 'time_controller.g.dart';

class TimeController = TimeControllerBase with _$TimeController;

abstract class TimeControllerBase with Store {
  final GetTimesUsecase getTimesUsecase;
  TimeControllerBase(this.getTimesUsecase);


  @observable
  bool isLoading = false;


  @observable
  List<TimeEntity> times = [];

  @observable
  ServerException exception = ServerException(code: 0, message: "");


  Future<void> getTimes() async {
    isLoading = true;

    final data = await getTimesUsecase();
    data.fold(
      (l) => exception = l, 
      (r) => times = r
    );

    isLoading = false;
  }
}