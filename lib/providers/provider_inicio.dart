import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:web_dimensionamiento_sistema_fotovoltaico/modelos/modelo_instalacion.dart';

class ProviderInicio with ChangeNotifier {
  final List<bool> _seccionesAbiertas = [false, false, false];
  final ModeloInstalacion _instalacion = ModeloInstalacion();
  final ModeloInstalacion _tempInstalacion = ModeloInstalacion();

  final List<String> _departamentos = [];
  final Map<String, List<String>> _municipios = {};

  String? _ampliacionesFuturas;
  String? get ampliacionesFuturas => _ampliacionesFuturas;

  final TextEditingController voltajeDController = TextEditingController();
  final TextEditingController voltajeAController = TextEditingController();
  final TextEditingController adultosController = TextEditingController();
  final TextEditingController jovenesController = TextEditingController();
  final TextEditingController ninosController = TextEditingController();

  List<bool> get seccionesAbiertas => _seccionesAbiertas;
  ModeloInstalacion get instalacion => _instalacion;
  ModeloInstalacion get tempInstalacion => _tempInstalacion;
  List<String> get departamentos => _departamentos;
  List<String> get municipios =>
      _tempInstalacion.departamento == null ? [] : _municipios[_tempInstalacion.departamento]!;

  ProviderInicio() {
    _cargarDatos();
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