import 'package:studentrecord/Admin/domain/entities/subject_student_record.dart';
import '../../domain/entities/student.dart';

class StudentRecord {
  Student student;
  List<SubjectStudentRecord> materias = [];

  StudentRecord({
    required this.student,
  });

  addMateria(SubjectStudentRecord materia) {
    materias.add(materia);
  }

  getMateria(String id) {
    late SubjectStudentRecord materiaFound;
    for (var materia in materias) {
      if (materia.subjectId == id) {
        materiaFound = materia;
      }
    }
    return materiaFound;
  }
}
