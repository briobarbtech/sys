enum MovementTypes {
  cargaInicialRegularidad,
  cargaInicialAcreditacion,
  equivalencia,
  pase,
  regularidad,
  acreditacionDirecta,
  acreditacionEnMesaFinal,
  comienzoCursado
}

class MovementType {
  static List<MovementType> movementTypes = [
    MovementType("Equivalencia", MovementTypes.equivalencia),
    MovementType(
        "Acreditacion directa", MovementTypes.cargaInicialAcreditacion),
    MovementType("pase", MovementTypes.pase)
  ];
  Enum id;
  String description;
  MovementType(this.description, this.id);
}
