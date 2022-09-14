import 'package:studentrecord/Admin/domain/entities/movement_type.dart';
import 'package:studentrecord/Admin/domain/entities/movimiento_de_trayecto_academico.dart';

class SubjectStudentRecord {
  String subjectId;
  List<MovimientoDeTrayectoAcademico> movesStudentRecord = [];
  String subjectState;
  String subjectName;

  SubjectStudentRecord({
    required this.subjectId,
    required this.subjectName,
    required this.subjectState,
  });
  // Método para agregar materias
  addMovement(MovimientoDeTrayectoAcademico movement) {
    movesStudentRecord.add(movement);
  }

  getLastMove() {
    return movesStudentRecord.last;
  }

  getTipo() {
    return movesStudentRecord.last.type;
  }

  createMovement(
    movementType,
    point,
    by,
    date,
    expirationDate,
  ) {
    switch (movementType) {
      case MovementTypes.cargaInicialRegularidad:
        MovimientoDeTrayectoAcademico movement = CargaInicialRegularidad(
            initialDate: date,
            responsible: by,
            value: point,
            expirationDate: expirationDate);
        addMovement(movement);
        break;
      case MovementTypes.cargaInicialAcreditacion:
        MovimientoDeTrayectoAcademico movement = CargaInicialAcreditacion(
            initialDate: date,
            responsible: by,
            value: point,
            expirationDate: expirationDate);
        addMovement(movement);
        break;
      case MovementTypes.equivalencia:
        MovimientoDeTrayectoAcademico movement = Equivalencia(
            initialDate: date,
            responsible: by,
            value: point,
            expirationDate: expirationDate,
            centroEducativo: "centroEducativo");
        addMovement(movement);
        break;
      case MovementTypes.pase:
        MovimientoDeTrayectoAcademico movement = Pase(
            initialDate: date,
            responsible: by,
            value: point,
            expirationDate: expirationDate);
        addMovement(movement);
        break;
      case MovementTypes.regularidad:
        MovimientoDeTrayectoAcademico movement = Regularidad(
            initialDate: date,
            responsible: by,
            value: point,
            expirationDate: expirationDate,
            cursado: "cursado");
        addMovement(movement);
        break;
      case MovementTypes.acreditacionDirecta:
        MovimientoDeTrayectoAcademico movement = AcreditacionDirecta(
            initialDate: date,
            responsible: by,
            value: point,
            expirationDate: expirationDate);
        addMovement(movement);
        break;
      case MovementTypes.acreditacionEnMesaFinal:
        MovimientoDeTrayectoAcademico movement = AcreditacionEnMesaFinal(
            initialDate: date,
            responsible: by,
            value: point,
            expirationDate: expirationDate);
        addMovement(movement);
        break;
      default:
    }
  }

  getPoint() {
    return movesStudentRecord.last.getPoint();
  }

  factory SubjectStudentRecord.fromJson(Map<String, dynamic> json) =>
      SubjectStudentRecord(
        subjectName: json["subjectName"],
        subjectId: json["subjectId"],
        subjectState: json["subjectState"],
      );

  Map<String, dynamic> toJson() => {
        "subjectName": subjectName,
        "subjectId": subjectId,
        "movesStudentRecord": movesStudentRecord,
        "subjectState": subjectState,
      };
}
