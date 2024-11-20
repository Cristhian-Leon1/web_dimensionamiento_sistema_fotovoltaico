import 'package:flutter/material.dart';

class CardEquipoData {
  final TextEditingController zonaController = TextEditingController();
  final TextEditingController equipoController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController potenciaController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();
  final ValueNotifier<double> potenciaTotal = ValueNotifier<double>(0);
  final ValueNotifier<double> consumoDiario = ValueNotifier<double>(0);

  CardEquipoData() {
    cantidadController.addListener(_updatePotenciaTotal);
    potenciaController.addListener(_updatePotenciaTotal);
    tiempoController.addListener(_updateConsumoDiario);
  }

  void _updatePotenciaTotal() {
    final int cantidad = int.tryParse(cantidadController.text) ?? 0;
    final double potencia = double.tryParse(potenciaController.text) ?? 0;
    potenciaTotal.value = cantidad * potencia;
  }

  void _updateConsumoDiario() {
    final double tiempo = double.tryParse(tiempoController.text) ?? 0;
    consumoDiario.value = potenciaTotal.value * tiempo;
  }
}

class ProviderConsumoAC with ChangeNotifier {
  final List<CardEquipoData> _equipos = [];
  List<CardEquipoData> get equipos => _equipos;

  final ValueNotifier<double> _consumoTotalDiario = ValueNotifier<double>(0);
  ValueNotifier<double> get consumoTotalDiario => _consumoTotalDiario;

  void _updateConsumoTotalDiario() {
    _consumoTotalDiario.value = _equipos.fold(0, (sum, equipo) => sum + equipo.consumoDiario.value);
  }

  void addEquipo() {
    final newEquipo = CardEquipoData();
    newEquipo.consumoDiario.addListener(_updateConsumoTotalDiario);
    _equipos.add(newEquipo);
    _updateConsumoTotalDiario();
    notifyListeners();
  }

  void removeEquipo(int index) {
    _equipos[index].consumoDiario.removeListener(_updateConsumoTotalDiario);
    _equipos.removeAt(index);
    _updateConsumoTotalDiario();
    notifyListeners();
  }
}