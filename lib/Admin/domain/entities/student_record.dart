import 'package:studentrecord/Admin/domain/entities/materia_de_trayecto_academico.dart';
import '../../domain/entities/student.dart';

class StudentRecord {
  Student student;
  List<MateriaDeTrayectoAcademico> materias = [];

  StudentRecord({
    required this.student,
  });

  addMateria(MateriaDeTrayectoAcademico materia) {
    materias.add(materia);
  }

  getMateria(String id) {
    late MateriaDeTrayectoAcademico materiaFound;
    for (var materia in materias) {
      if (materia.idMateria == id) {
        materiaFound = materia;
      }
    }
    return materiaFound;
  }
}
