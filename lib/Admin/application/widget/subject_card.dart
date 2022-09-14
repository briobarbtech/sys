import 'dart:js';

import 'package:flutter/material.dart';
import 'package:studentrecord/Admin/domain/entities/subject_student_record.dart';
import 'package:go_router/go_router.dart';

Widget subjectCard(SubjectStudentRecord subject) {
  return Card(
    child: Row(
      children: [
        Column(
          children: [
            Text("Materia: ${subject.subjectName}"),
            const Text("Año: XX")
          ],
        ),
        const Text("Plan de estudio: XXXXXXX"),
        ElevatedButton(
            onPressed: () {
              context.go('');
            },
            child: child)
      ],
    ),
  );
}
