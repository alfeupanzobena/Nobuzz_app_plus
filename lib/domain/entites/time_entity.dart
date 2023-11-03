import 'package:nobuzz_app_plus/domain/entites/day_week_entity.dart';

class TimeEntity {
  String? estado;
  DayWeekEntity? segunda;
  DayWeekEntity? terca;
  DayWeekEntity? quarta;
  DayWeekEntity? quinta;
  DayWeekEntity? sexta;
  DayWeekEntity? sabado;
  DayWeekEntity? domingo;


  TimeEntity({
    this.estado, 
    this.segunda,
    this.terca,
    this.quarta,
    this.quinta,
    this.sexta,
    this.sabado,
    this.domingo
  });
}