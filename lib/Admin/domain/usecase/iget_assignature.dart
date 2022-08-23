import 'package:studentrecord/Admin/domain/entities/materia_de_trayecto_academico.dart';

abstract class IGetAssignature {
  Future<MateriaDeTrayectoAcademico> getStudentRecord();
}
