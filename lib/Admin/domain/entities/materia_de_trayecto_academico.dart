import 'package:studentrecord/Admin/domain/entities/movimiento_de_trayecto_academico.dart';

class MateriaDeTrayectoAcademico {
  String idMateria;
  List<MovimientoDeTrayectoAcademico> movimientosDeTrayectoAcademico = [];
  String estado;
  String nombre;

  MateriaDeTrayectoAcademico({
    required this.idMateria,
    required this.nombre,
    required this.estado,
  });
  // Método para agregar materias
  addMovement(MovimientoDeTrayectoAcademico movement) {
    movimientosDeTrayectoAcademico.add(movement);
  }

  getLastMove() {
    return movimientosDeTrayectoAcademico.last;
  }

  getTipo() {
    return movimientosDeTrayectoAcademico.last.tipo;
  }

  createMovement(
    movementType,
    point,
    by,
    date,
    expirationDate,
  ) {
    switch (movementType) {
      case "cargaInicialRegularidad":
        MovimientoDeTrayectoAcademico movement = CargaInicialRegularidad(
            fecha: date,
            responsable: by,
            valor: point,
            fechaCaducidadRegularidad: expirationDate);
        addMovement(movement);
        break;
      case "cargaInicialAcreditacion":
        MovimientoDeTrayectoAcademico movement = CargaInicialAcreditacion(
            fecha: date,
            responsable: by,
            valor: point,
            fechaCaducidadRegularidad: expirationDate);
        addMovement(movement);
        break;
      case "equivalencia":
        MovimientoDeTrayectoAcademico movement = Equivalencia(
            fecha: date,
            responsable: by,
            valor: point,
            fechaCaducidadRegularidad: expirationDate,
            centroEducativo: "centroEducativo");
        addMovement(movement);
        break;
      case "pase":
        MovimientoDeTrayectoAcademico movement = Pase(
            fecha: date,
            responsable: by,
            valor: point,
            fechaCaducidadRegularidad: expirationDate);
        addMovement(movement);
        break;
      case "regularidad":
        MovimientoDeTrayectoAcademico movement = Regularidad(
            fecha: date,
            responsable: by,
            valor: point,
            fechaCaducidadRegularidad: expirationDate,
            cursado: "cursado");
        addMovement(movement);
        break;
      case "acreditacionDirecta":
        MovimientoDeTrayectoAcademico movement = AcreditacionDirecta(
            fecha: date,
            responsable: by,
            valor: point,
            fechaCaducidadRegularidad: expirationDate);
        addMovement(movement);
        break;
      case "acreditacionEnMesaFinal":
        MovimientoDeTrayectoAcademico movement = AcreditacionEnMesaFinal(
            fecha: date,
            responsable: by,
            valor: point,
            fechaCaducidadRegularidad: expirationDate);
        addMovement(movement);
        break;
      default:
    }
  }

  getNota() {
    return movimientosDeTrayectoAcademico.last.getNota();
  }

  factory MateriaDeTrayectoAcademico.fromJson(Map<String, dynamic> json) =>
      MateriaDeTrayectoAcademico(
        nombre: json["nombre"],
        idMateria: json["idMateria"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "idMateria": idMateria,
        "movimientosDeTrayectoAcademico": movimientosDeTrayectoAcademico,
        "estado": estado,
      };
}
