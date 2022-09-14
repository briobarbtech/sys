import 'package:flutter/material.dart';
import 'package:studentrecord/Admin/domain/entities/subject_student_record.dart';
import 'package:studentrecord/Admin/domain/entities/movement_type.dart';
import 'package:studentrecord/Admin/domain/entities/movimiento_de_trayecto_academico.dart';

class FormMateria extends StatelessWidget {
  final SubjectStudentRecord materia;

  const FormMateria(this.materia, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey keyForm = GlobalKey();
    TextEditingController typeOfMove = TextEditingController();
    TextEditingController newNota = TextEditingController();
    return Scaffold(
      body: Center(
        child: Center(
            child: Form(
                child: elementListItems("Tipos de movimiento",
                    MovementType.movementTypes, typeOfMove))),
      ),
    );
  }
}

Widget elementListItems(title, list, tipo) {
  var items = list;
  var dropdownValue = items.first;

  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(title),
    const SizedBox(
      width: 20.0,
    ),
    DropdownButton<MovementType>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.blueAccent,
      ),
      onChanged: (MovementType? movement) {
        tipo = movement;
        dropdownValue = movement;
      },
      items: items.map<DropdownMenuItem<MovementType>>((MovementType value) {
        return DropdownMenuItem<MovementType>(
          value: value,
          child: Text(value.description),
        );
      }).toList(),
    ),
  ]);
}
