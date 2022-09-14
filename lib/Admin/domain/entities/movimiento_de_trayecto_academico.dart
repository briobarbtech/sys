import 'package:studentrecord/Admin/domain/entities/movement_type.dart';
import 'package:studentrecord/Admin/domain/entities/point.dart';
import 'dart:convert';

import 'package:studentrecord/Admin/domain/entities/user.dart';

MovimientoDeTrayectoAcademico movimientoDeTrayectoAcademicoFromJson(
        String str) =>
    MovimientoDeTrayectoAcademico.fromJson(json.decode(str));

String movimientoDeTrayectoAcademicoToJson(
        MovimientoDeTrayectoAcademico data) =>
    json.encode(data.toJson());

class MovimientoDeTrayectoAcademico {
  MovimientoDeTrayectoAcademico(
      {required this.initialDate,
      required this.responsible,
      required this.value,
      required this.expirationDate,
      required this.type});

  String initialDate;
  String expirationDate;
  IESUser responsible;
  Point value; // Puede no  tener Point
  Enum type;

  factory MovimientoDeTrayectoAcademico.fromJson(Map<String, dynamic> json) =>
      MovimientoDeTrayectoAcademico(
          expirationDate: json["expirationDate"],
          initialDate: json["fecha"],
          responsible: json["responsible"],
          value: json["value"],
          type: json["type"]);

  Map<String, dynamic> toJson() => {
        "initialDate": initialDate,
        "responsible": responsible,
        "value": value,
        "type": type
      };

  getPoint() {
    return value.value;
  }
}

class CargaInicialRegularidad extends MovimientoDeTrayectoAcademico {
  CargaInicialRegularidad(
      {required super.initialDate,
      required super.responsible,
      required super.value,
      required super.expirationDate,
      super.type = MovementTypes.cargaInicialRegularidad});
}

class CargaInicialAcreditacion extends MovimientoDeTrayectoAcademico {
  CargaInicialAcreditacion(
      {required super.initialDate,
      required super.responsible,
      required super.value,
      required super.expirationDate,
      super.type = MovementTypes.acreditacionDirecta});
}

class Equivalencia extends MovimientoDeTrayectoAcademico {
  String centroEducativo;
  Equivalencia(
      {required super.initialDate,
      required super.responsible,
      required super.value,
      required super.expirationDate,
      required this.centroEducativo,
      super.type = MovementTypes.equivalencia});

  factory Equivalencia.fromJson(Map<String, dynamic> json) => Equivalencia(
      initialDate: json["initialDate"],
      responsible: json["responsible"],
      value: json["value"],
      centroEducativo: json["centroEducativo"],
      expirationDate: json["expirationDate"],
      type: json["type"]);
  @override
  Map<String, dynamic> toJson() => {
        "initialDate": initialDate,
        "responsible": responsible,
        "value": value,
        "centroEducativo": centroEducativo,
        "type": type
      };
}

class Pase extends MovimientoDeTrayectoAcademico {
  Pase(
      {required super.initialDate,
      required super.responsible,
      required super.value,
      required super.expirationDate,
      super.type = MovementTypes.pase});
}

class ComienzoDeCursado extends MovimientoDeTrayectoAcademico {
  ComienzoDeCursado(
      {required super.initialDate,
      required super.responsible,
      required super.value,
      required super.expirationDate,
      super.type = MovementTypes.comienzoCursado});
}

class Regularidad extends MovimientoDeTrayectoAcademico {
  String cursado;
  Regularidad(
      {required super.initialDate,
      required super.responsible,
      required super.value,
      required super.expirationDate,
      required this.cursado,
      super.type = MovementTypes.regularidad});
  factory Regularidad.fromJson(Map<String, dynamic> json) => Regularidad(
      initialDate: json["initialDate"],
      responsible: json["responsible"],
      value: json["value"],
      expirationDate: json["fechaCaducidadMateria"],
      cursado: json["cursado"],
      type: json["type"]);
  @override
  Map<String, dynamic> toJson() => {
        "initialDate": initialDate,
        "responsible": responsible,
        "value": value,
        "cursado": cursado,
        "type": type
      };
}

class AcreditacionDirecta extends MovimientoDeTrayectoAcademico {
  AcreditacionDirecta(
      {required super.initialDate,
      required super.responsible,
      required super.value,
      required super.expirationDate,
      super.type = MovementTypes.acreditacionDirecta});
}

class AcreditacionEnMesaFinal extends MovimientoDeTrayectoAcademico {
  AcreditacionEnMesaFinal(
      {required super.initialDate,
      required super.responsible,
      required super.value,
      required super.expirationDate,
      super.type = MovementTypes.acreditacionEnMesaFinal});
}
