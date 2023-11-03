import 'package:nobuzz_app_plus/domain/entites/shift_entity.dart';

class DayWeekEntity {
  int? number;
  String? name;
  ShiftEntity? manha;
  ShiftEntity? tarde;
  ShiftEntity? noite;

  DayWeekEntity({ 
    required this.name, 
    required this.number, 
    this.manha, 
    this.tarde, 
    this.noite
  }); 
}
