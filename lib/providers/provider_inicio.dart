import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:web_dimensionamiento_sistema_fotovoltaico/modelos/modelo_instalacion.dart';

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

class ProviderInicio with ChangeNotifier {
  final List<bool> _seccionesAbiertas = [false, false, false];
  final ModeloInstalacion _instalacion = ModeloInstalacion();
  final ModeloInstalacion _tempInstalacion = ModeloInstalacion();

  final List<String> _departamentos = [];
  final Map<String, List<String>> _municipios = {};

  final List<CardEquipoData> _equipos = [];
  List<CardEquipoData> get equipos => _equipos;

  String? _ampliacionesFuturas;
  String? get ampliacionesFuturas => _ampliacionesFuturas;

  final ValueNotifier<double> _potenciaTotal = ValueNotifier<double>(0);
  final ValueNotifier<double> _consumoDiario = ValueNotifier<double>(0);

  ValueNotifier<double> get potenciaTotal => _potenciaTotal;
  ValueNotifier<double> get consumoDiario => _consumoDiario;

  final TextEditingController voltajeDController = TextEditingController();
  final TextEditingController voltajeAController = TextEditingController();
  final TextEditingController adultosController = TextEditingController();
  final TextEditingController jovenesController = TextEditingController();
  final TextEditingController ninosController = TextEditingController();
  final TextEditingController zonaController = TextEditingController();
  final TextEditingController equipoController = TextEditingController();
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController potenciaController = TextEditingController();
  final TextEditingController tiempoController = TextEditingController();

  List<bool> get seccionesAbiertas => _seccionesAbiertas;
  ModeloInstalacion get instalacion => _instalacion;
  ModeloInstalacion get tempInstalacion => _tempInstalacion;
  List<String> get departamentos => _departamentos;
  List<String> get municipios =>
      _tempInstalacion.departamento == null ? [] : _municipios[_tempInstalacion.departamento]!;

  ProviderInicio() {
    _cargarDatos();
    _initListeners();
  }

  Future<void> _cargarDatos() async {
    final String jsonString = await rootBundle.loadString('assets/colombia.json');
    final List<dynamic> data = json.decode(jsonString);

    for (var item in data) {
      final String departamento = item['departamento'];
      final List<String> ciudades = List<String>.from(item['ciudades']);
      _departamentos.add(departamento);
      _municipios[departamento] = ciudades;
    }

    notifyListeners();
  }

  void _initListeners() {
    cantidadController.addListener(_updatePotenciaTotal);
    potenciaController.addListener(_updatePotenciaTotal);
    tiempoController.addListener(_updateConsumoDiario);
  }

  void _updatePotenciaTotal() {
    final int cantidad = int.tryParse(cantidadController.text) ?? 0;
    final double potencia = double.tryParse(potenciaController.text) ?? 0;
    _potenciaTotal.value = cantidad * potencia;
  }

  void _updateConsumoDiario() {
    final double tiempo = double.tryParse(tiempoController.text) ?? 0;
    _consumoDiario.value = _potenciaTotal.value * tiempo;
  }

  void alternarSeccion(int indice) {
    for (int i = 0; i < _seccionesAbiertas.length; i++) {
      _seccionesAbiertas[i] = i == indice ? !_seccionesAbiertas[i] : false;
    }
    notifyListeners();
  }

  void seleccionarDepartamento(String? departamento) {
    _tempInstalacion.departamento = departamento;
    _tempInstalacion.municipio = null;
    notifyListeners();
  }

  void seleccionarMunicipio(String? municipio) {
    _tempInstalacion.municipio = municipio;
    notifyListeners();
  }

  void seleccionarAplicacion(String? aplicacion) {
    _tempInstalacion.aplicacion = aplicacion;
    notifyListeners();
  }

  void seleccionarUtilizacion(String? utilizacion) {
    _tempInstalacion.utilizacion = utilizacion;
    notifyListeners();
  }

  void seleccionarAmpliacionesFuturas(String? valor) {
    _ampliacionesFuturas = valor;
    notifyListeners();
  }

  void addEquipo() {
    _equipos.add(CardEquipoData());
    notifyListeners();
  }

  void removeEquipo(int index) {
    _equipos.removeAt(index);
    notifyListeners();
  }

  void guardarDatos() {
    _instalacion.departamento = _tempInstalacion.departamento;
    _instalacion.municipio = _tempInstalacion.municipio;
    _instalacion.aplicacion = _tempInstalacion.aplicacion;
    _instalacion.utilizacion = _tempInstalacion.utilizacion;
    _instalacion.voltajeDC = double.tryParse(voltajeDController.text);
    _instalacion.voltajeAC = double.tryParse(voltajeAController.text);
    _instalacion.numAdultos = int.tryParse(adultosController.text);
    _instalacion.numJovenes = int.tryParse(jovenesController.text);
    _instalacion.numNinos = int.tryParse(ninosController.text);
    _instalacion.ampliaciones = _ampliacionesFuturas;
    _instalacion.imprimirDatos();
    notifyListeners();
  }
}