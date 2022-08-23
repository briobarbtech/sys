import 'package:studentrecord/Admin/domain/repo/istudent_record_repo_port.dart';
import 'package:studentrecord/Admin/domain/usecase/iget_student_record.dart';

import '../entities/student_record.dart';

class GetStudentRecord implements IGetStudentRecord {
  IStudentRecordRepositoryPort studentRecordRepositoryPort;
  GetStudentRecord(this.studentRecordRepositoryPort);

  @override
  Future<StudentRecord> getStudentRecord() {
    return studentRecordRepositoryPort.getStudentRecord();
  }
}
