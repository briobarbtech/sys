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
  MovimientoDeTrayectoAcademico({
    required this.fecha,
    required this.responsable,
    required this.valor,
    required this.fechaCaducidadRegularidad,
  });

  String fecha;
  String fechaCaducidadRegularidad;
  IESUser responsable;
  Nota valor;

  factory MovimientoDeTrayectoAcademico.fromJson(Map<String, dynamic> json) =>
      MovimientoDeTrayectoAcademico(
        fechaCaducidadRegularidad: json["fechaDeCaducidad"],
        fecha: json["fecha"],
        responsable: json["responsable"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "responsable": responsable,
        "valor": valor,
      };

  getNota() {
    return valor.valor;
  }
}

enum MovementTypes {
  cargaInicialRegularidad,
  cargaInicialAcreditacion,
  equivalencia,
  pase,
  regularidad,
  acreditacionDirecta,
  acreditacionEnMesaFinal
}

class CargaInicialRegularidad extends MovimientoDeTrayectoAcademico {
  CargaInicialRegularidad(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad});
}

class CargaInicialAcreditacion extends MovimientoDeTrayectoAcademico {
  CargaInicialAcreditacion(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad});
}

class Equivalencia extends MovimientoDeTrayectoAcademico {
  String centroEducativo;
  Equivalencia(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      required this.centroEducativo});

  factory Equivalencia.fromJson(Map<String, dynamic> json) => Equivalencia(
      fecha: json["fecha"],
      responsable: json["responsable"],
      valor: json["valor"],
      centroEducativo: json["centroEducativo"],
      fechaCaducidadRegularidad: json["fechaCaducidadRegularidad"]);
  @override
  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "responsable": responsable,
        "valor": valor,
        "centroEducativo": centroEducativo
      };
}

class Pase extends MovimientoDeTrayectoAcademico {
  Pase(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad});
}

class ComienzoDeCursado extends MovimientoDeTrayectoAcademico {
  ComienzoDeCursado(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad});
}

class Regularidad extends MovimientoDeTrayectoAcademico {
  String cursado;
  Regularidad(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad,
      required this.cursado});
  factory Regularidad.fromJson(Map<String, dynamic> json) => Regularidad(
      fecha: json["fecha"],
      responsable: json["responsable"],
      valor: json["valor"],
      fechaCaducidadRegularidad: json["fechaCaducidadMateria"],
      cursado: json["cursado"]);
  @override
  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "responsable": responsable,
        "valor": valor,
        "cursado": cursado
      };
}

class AcreditacionDirecta extends MovimientoDeTrayectoAcademico {
  AcreditacionDirecta(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad});
}

class AcreditacionEnMesaFinal extends MovimientoDeTrayectoAcademico {
  AcreditacionEnMesaFinal(
      {required super.fecha,
      required super.responsable,
      required super.valor,
      required super.fechaCaducidadRegularidad});
}
