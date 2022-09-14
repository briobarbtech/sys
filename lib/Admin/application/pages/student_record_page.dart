// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studentrecord/Admin/application/pages/assignature_list.dart';
import 'package:studentrecord/Admin/application/pages/form_materia.dart';
import 'package:studentrecord/Admin/application/pages/profile.dart';
import 'package:studentrecord/Admin/application/provider/provider.dart';
import 'package:studentrecord/Admin/application/widget/movement_from_student_record.dart';
import 'package:studentrecord/Admin/application/widget/user_profile.dart';
import 'package:studentrecord/Admin/domain/entities/subject_student_record.dart';
import 'package:studentrecord/Admin/domain/entities/movimiento_de_trayecto_academico.dart';
import 'package:studentrecord/Admin/domain/entities/point.dart';
import 'package:studentrecord/Admin/domain/entities/student_record.dart';
import 'package:studentrecord/Admin/application/widget/subject_card.dart';
import 'package:studentrecord/Admin/domain/entities/user.dart';

class StudentRecordPage extends ConsumerWidget {
  final SubjectStudentRecord subject;
  final IESUser user;
  const StudentRecordPage(this.subject, this.user, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: const [BackButton()],
      ),
      body: Center(
        child: Column(children: [
          userProfile(user),
          subjectCard(subject),
          // TODO agregar historial de trayecto académico
        ]),
      ),
    );
  }
}
