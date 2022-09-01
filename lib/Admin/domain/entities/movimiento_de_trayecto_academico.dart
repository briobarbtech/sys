import 'package:studentrecord/Admin/domain/entities/movement_type.dart';
import 'package:studentrecord/Admin/domain/entities/nota.dart';
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
      {required this.fecha,
      required this.responsable,
      required this.valor,
      required this.fechaCaducidadRegularidad,
      required this.tipo});

  String fecha;
  String fechaCaducidadRegularidad;
  IESUser responsable;
  Nota valor; // Puede no  tener nota
  Enum tipo;

  factory MovimientoDeTrayectoAcademico.fromJson(Map<String, dynamic> json) =>
      MovimientoDeTrayectoAcademico(
          fechaCaducidadRegularidad: json["fechaDeCaducidad"],
          fecha: json["fecha"],
          responsable: json["responsable"],
          valor: json["valor"],
          tipo: json["tipo"]);

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "responsable": responsable,
        "valor": valor,
        "tipo": tipo
      };

  getNota() {
    return valor.valor;
  }
}

class CargaInicialRegularidad extends MovimientoDeTrayectoAcademico {
  CargaInicialRegularidad(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      super.tipo = MovementTypes.cargaInicialRegularidad});
}

class CargaInicialAcreditacion extends MovimientoDeTrayectoAcademico {
  CargaInicialAcreditacion(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      super.tipo = MovementTypes.acreditacionDirecta});
}

class Equivalencia extends MovimientoDeTrayectoAcademico {
  String centroEducativo;
  Equivalencia(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      required this.centroEducativo,
      super.tipo = MovementTypes.equivalencia});

  factory Equivalencia.fromJson(Map<String, dynamic> json) => Equivalencia(
      fecha: json["fecha"],
      responsable: json["responsable"],
      valor: json["valor"],
      centroEducativo: json["centroEducativo"],
      fechaCaducidadRegularidad: json["fechaCaducidadRegularidad"],
      tipo: json["tipo"]);
  @override
  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "responsable": responsable,
        "valor": valor,
        "centroEducativo": centroEducativo,
        "tipo": tipo
      };
}

class Pase extends MovimientoDeTrayectoAcademico {
  Pase(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      super.tipo = MovementTypes.pase});
}

class ComienzoDeCursado extends MovimientoDeTrayectoAcademico {
  ComienzoDeCursado(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      super.tipo = MovementTypes.comienzoCursado});
}

class Regularidad extends MovimientoDeTrayectoAcademico {
  String cursado;
  Regularidad(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      required this.cursado,
      super.tipo = MovementTypes.regularidad});
  factory Regularidad.fromJson(Map<String, dynamic> json) => Regularidad(
      fecha: json["fecha"],
      responsable: json["responsable"],
      valor: json["valor"],
      fechaCaducidadRegularidad: json["fechaCaducidadMateria"],
      cursado: json["cursado"],
      tipo: json["tipo"]);
  @override
  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "responsable": responsable,
        "valor": valor,
        "cursado": cursado,
        "tipo": tipo
      };
}

class AcreditacionDirecta extends MovimientoDeTrayectoAcademico {
  AcreditacionDirecta(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      super.tipo = MovementTypes.acreditacionDirecta});
}

class AcreditacionEnMesaFinal extends MovimientoDeTrayectoAcademico {
  AcreditacionEnMesaFinal(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      super.tipo = MovementTypes.acreditacionEnMesaFinal});
}
