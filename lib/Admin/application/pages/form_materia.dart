import 'package:flutter/material.dart';
import 'package:studentrecord/Admin/domain/entities/materia_de_trayecto_academico.dart';

class FormMateria extends StatelessWidget {
  final MateriaDeTrayectoAcademico materia;

  const FormMateria(this.materia, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey keyForm = GlobalKey();
    TextEditingController typeOfMove = TextEditingController(materia.);
    TextEditingController newNota = TextEditingController();
    return Scaffold(
      body: Center(
        child: Center(child: Form(child: elementListItems())),
      ),
    );
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
