import 'package:nobuzz_app_plus/domain/entites/shift_entity.dart';

class ShiftDto extends ShiftEntity {
  ShiftDto({
    String? tempo,
    int? graus
  }): super(
    tempo: tempo,
    graus: graus
  );

  factory ShiftDto.fromJson(dynamic json) => ShiftDto(
    tempo: json[0]["tempo"] ?? "",
    graus: json[0]["graus"] is String ? int.parse(json[0]["graus"]) : json[0]["graus"] ?? 0
  );
}