import 'package:flutter/material.dart';

class ListaConOpciones extends StatelessWidget {
  const ListaConOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'Tecnicatura superior en computacion y redes';
    var items = [
      'Tecnicatura superior en computacion y redes',
      'Tecnicatura superior en desarrollo de software'
    ];
    return DropdownButton(
      isExpanded: true,
      // Initial Value
      value: dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 12,
              )),
        );
      }).toList(),
      onChanged: (String? value) {},
      // After selecting the desired option,it will
      // change button value to selected value
    );
  }
}
