import 'package:studentrecord/Admin/domain/entities/subject_student_record.dart';

abstract class IGetAssignature {
  Future<SubjectStudentRecord> getStudentRecord();
}
