import 'package:nobuzz_app_plus/data/dtos/day_week_dto.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';

class TimeDto extends TimeEntity {
  TimeDto({
    String? estado,
    DayWeekDto? segunda,
    DayWeekDto? terca,
    DayWeekDto? quarta,
    DayWeekDto? quinta,
    DayWeekDto? sexta,
    DayWeekDto? sabado,
    DayWeekDto? domingo
  }): super(
    estado: estado,
    segunda: segunda,
    terca: terca,
    quarta: quarta,
    quinta: quinta,
    sexta: sexta,
    sabado: sabado,
    domingo: domingo
  );

  factory TimeDto.fromJson(dynamic json) => TimeDto(
    estado: json["estado"] ?? "",
    segunda: json["dias"][0]["segunda"] == null ? null : DayWeekDto.fromJson(json["dias"][0]["segunda"], "Segunda", 1),
    terca: json["dias"][0]["terca"] == null ? null : DayWeekDto.fromJson(json["dias"][0]["terca"], "Terça", 2),
    quarta: json["dias"][0]["quarta"] == null ? null : DayWeekDto.fromJson(json["dias"][0]["quarta"], "Quarta", 3),
    quinta: json["dias"][0]["quinta"] == null ? null : DayWeekDto.fromJson(json["dias"][0]["quinta"], "Quinta", 4),
    sexta: json["dias"][0]["sexta"] == null ? null : DayWeekDto.fromJson(json["dias"][0]["sexta"], "Sexta", 5),
    sabado: json["dias"][0]["sabado"] == null ? null : DayWeekDto.fromJson(json["dias"][0]["sabado"], "Sábado", 6),
    domingo: json["dias"][0]["domingo"] == null ? null : DayWeekDto.fromJson(json["dias"][0]["domingo"], "Domingo", 7),
  ); 
}