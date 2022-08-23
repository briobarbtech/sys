// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studentrecord/Admin/application/provider/provider.dart';
import 'package:studentrecord/Admin/domain/entities/materia_de_trayecto_academico.dart';
import 'package:studentrecord/Admin/domain/entities/movimiento_de_trayecto_academico.dart';
import 'package:studentrecord/Admin/domain/entities/nota.dart';
import 'package:studentrecord/Admin/domain/entities/user.dart';

class StudentRecordPage extends ConsumerWidget {
  const StudentRecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getProductData);
    var items = [
      "cargaInicialRegularidad",
      "cargaInicialAcreditacion",
      "equivalencia",
      "pase",
      "regularidad",
      "acreditacionDirecta",
      "acreditacionEnMesaFinal"
    ];
    var notas = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

    return MaterialApp(
        title: "StudentRecord",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Student Record edit"),
          ),
          body: data.when(
              data: (data) {
                var materia = data.getMateria("1234");
                var notaFinal = materia.getLastMove();
                final finalPoint = StateProvider((ref) => notaFinal);
                var nota = ref.watch(finalPoint);
                return Center(
                    child: Column(
                  children: [
                    Text("Nota final ${nota.getNota()}"),
                    elementListItems(data, "Tipos de movimientos: ", items),
                    elementListItems(data, "Notas: ", notas),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              materia.addMovement(MovimientoDeTrayectoAcademico(
                                  fecha: "fecha",
                                  responsable: IESUser(
                                      firstname: "firstname",
                                      surname: "surname",
                                      dni: 41418471,
                                      birthdate: DateTime(2020),
                                      email: "email"),
                                  valor: Nota(valor: 5),
                                  fechaCaducidadRegularidad:
                                      "fechaCaducidadRegularidad"));
                              ref.read(finalPoint.notifier).state =
                                  materia.getLastMove();
                              print(nota.getNota());
                            },
                            child: const Text("Save")),
                        const SizedBox(
                          width: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Cancel",
                          ),
                        ),
                      ],
                    )
                  ],
                ));
              },
              error: (e, s) => const Center(
                    child: Text("Ups! Ocurrió un error. Troesman"),
                  ),
              loading: () => const CircularProgressIndicator()),
        ));
  }
}

Widget elementListItems(data, title, list) {
  var items = list;
  var dropdownValue = items.first;

  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(title),
    const SizedBox(
      width: 20.0,
    ),
    DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (String? newValue) {
        dropdownValue = newValue!;
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  ]);
}
