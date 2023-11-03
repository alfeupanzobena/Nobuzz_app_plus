import 'package:nobuzz_app_plus/data/dtos/shift_dto.dart';
import 'package:nobuzz_app_plus/domain/entites/day_week_entity.dart';

class DayWeekDto extends DayWeekEntity {
  DayWeekDto({
    int? number,
    String? name,
    ShiftDto? manha,
    ShiftDto? tarde,
    ShiftDto? noite
  }): super(
    number: number,
    name: name,
    manha: manha,
    tarde: tarde,
    noite: noite
  );


  factory DayWeekDto.fromJson(dynamic json, String name, int number) => DayWeekDto(
    number: number,
    name: name,
    manha: json[0]["manha"] == null ? null : ShiftDto.fromJson(json[0]["manha"]),
    tarde: json[0]["tarde"] == null ? null : ShiftDto.fromJson(json[0]["tarde"]),
    noite: json[0]["noite"] == null ? null : ShiftDto.fromJson(json[0]["noite"])
  );
  
}