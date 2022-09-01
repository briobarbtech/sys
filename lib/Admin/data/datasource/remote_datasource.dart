import 'package:studentrecord/Admin/domain/entities/materia_de_trayecto_academico.dart';
import 'package:studentrecord/Admin/domain/entities/movement_type.dart';
import 'package:studentrecord/Admin/domain/entities/movimiento_de_trayecto_academico.dart';
import 'package:studentrecord/Admin/domain/entities/nota.dart';
import 'package:studentrecord/Admin/domain/entities/student.dart';
import 'package:studentrecord/Admin/domain/entities/student_record.dart';
import 'package:studentrecord/Admin/domain/entities/user.dart';
import 'iremote_datasource.dart';

class RemoteDatasourceFake implements IRemoteDatasource {
  @override
  Future<StudentRecord> getStudentRecord() async {
    // Creamos el usuario Brian
    IESUser brian = IESUser(
        firstname: "Brian",
        surname: "Ruben",
        dni: 41418471,
        birthdate: DateTime(1998, 10, 20),
        email: "brian.barquesi@gmail.com");
    // Creamos un estudiante con el usuario Brian
    Student brianStudent = Student(user: brian);
    // Creamos un trayecto para la materia lengua
    MateriaDeTrayectoAcademico lengua = MateriaDeTrayectoAcademico(
        estado: 'Regular', idMateria: '1234', nombre: 'Lengua');
    // Creamos un movimiento para Lengua
    MovimientoDeTrayectoAcademico lenguaRegistro =
        MovimientoDeTrayectoAcademico(
      tipo: MovementTypes.equivalencia,
      fechaCaducidadRegularidad: "20-10-1998",
      responsable: brian,
      valor: Nota(valor: 10),
      fecha: '20/10/1998',
    );
    // Agregamos el movimiento de la materia Lengua a la materia de Brian
    lengua.addMovement(lenguaRegistro);
    // Creamos un Historial de estudios con el estudiante Brian
    StudentRecord studentRecord = StudentRecord(
      student: brianStudent,
    );
    // Agregamos la materia del trayecto lengua al historial de estudios de Brian
    studentRecord.addMateria(lengua);

    return studentRecord;
  }
}
