import 'dart:io';

import 'package:foodsfl/movil/Entities/Mesas.dart';

class MesasState {
  final int? idMesas;
  final bool? isLoding;
  final List<Mesas>? mesas;

  MesasState({
    required this.idMesas,
    this.isLoding,
    this.mesas = const []
  });


MesasState copyWith({
  int? idMesas,
  bool? isLoding,
List<Mesas>? mesas
}) => MesasState(
  idMesas: idMesas ?? this.idMesas,
  isLoding: isLoding ?? this.isLoding,
mesas: mesas ?? this.mesas
);



}
