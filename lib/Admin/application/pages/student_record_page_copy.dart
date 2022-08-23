// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studentrecord/Admin/application/pages/assignature_list.dart';
import 'package:studentrecord/Admin/application/pages/profile.dart';
import 'package:studentrecord/Admin/application/provider/provider.dart';
import 'package:studentrecord/Admin/domain/entities/materia_de_trayecto_academico.dart';
import 'package:studentrecord/Admin/domain/entities/movimiento_de_trayecto_academico.dart';
import 'package:studentrecord/Admin/domain/entities/nota.dart';
import 'package:studentrecord/Admin/domain/entities/student_record.dart';
import 'package:studentrecord/Admin/domain/entities/user.dart';

class StudentRecordPage extends ConsumerWidget {
  final int index;
  final FutureProvider<StudentRecord> studentRecord;
  const StudentRecordPage(this.index, this.studentRecord, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(studentRecord);
    return data.when(
        data: (data) {
          var materia = data.materias[index];
          var nombre = materia.nombre;
          var nota = materia.getNota();
          return Scaffold(
            appBar: AppBar(title: Text(nombre)),
            body: Center(
                child: Column(
              children: [
                Text("Nombre de la materia: $nombre"),
                Text("Nota: $nota"),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context)=>  ));
                        },
                        child: const Text("Editar"))
                  ],
                )
              ],
            )),
          );
        },
        error: (e, s) => const Center(
              child: Text("Error"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
