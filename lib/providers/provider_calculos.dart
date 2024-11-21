import 'package:flutter/material.dart';
import 'provider_inicio.dart';

class ProviderCalculos with ChangeNotifier {
  late final ProviderInicio providerInicio;
  ProviderCalculos(this.providerInicio) {
    _initListeners();
  }

  String _selectedVoltageType = 'Voltaje DC';
  String get selectedVoltageType => _selectedVoltageType;

  void updateProviderInicio(ProviderInicio newProviderInicio) {
    if (providerInicio != newProviderInicio) {
      providerInicio = newProviderInicio;
      notifyListeners();
    }
  }

  final TextEditingController HSPController = TextEditingController();
  final TextEditingController kbController = TextEditingController();
  final TextEditingController kcController = TextEditingController();
  final TextEditingController kvController = TextEditingController();
  final TextEditingController kaController = TextEditingController();
  final TextEditingController numDiasController = TextEditingController();
  final TextEditingController profundidadController = TextEditingController();

  double get consumoTotalDC => providerInicio.consumoTotalDiarioDC.value;
  double get consumoTotalAC => providerInicio.consumoTotalDiarioAC.value;

  double get consumoTotal => consumoTotalDC + (consumoTotalAC / 0.8);

  double get HSPValue {
    final hsp = double.tryParse(HSPController.text) ?? 0.0;
    return (hsp * 1000) / 1000;
  }

  double get rendimientoInstalacion {
    final kb = double.tryParse(kbController.text);
    final kc = double.tryParse(kcController.text);
    final kv = double.tryParse(kvController.text);
    final ka = double.tryParse(kaController.text);
    final numDias = double.tryParse(numDiasController.text);
    final profundidad = double.tryParse(profundidadController.text);

    if (kb == null || kc == null || kv == null || ka == null || numDias == null || profundidad == null) {
      return 0.0;
    }

    return (1 - kb - kc - kv) * (1 - ka * (numDias / profundidad));
  }

  get energiaDiaria {
    if (consumoTotal == 0 || rendimientoInstalacion == 0) {
      return 0.0;
    }
    return consumoTotal / rendimientoInstalacion;
  }

  get capacidadUtil {
    final numDias = double.tryParse(numDiasController.text) ?? 0.0;
    final voltaje = selectedVoltageType == 'Voltaje DC' ? providerInicio.instalacion.voltajeDC : providerInicio.instalacion.voltajeAC;
    return (energiaDiaria * numDias) / (voltaje ?? 1);
  }

  void setSelectedVoltageType(String? newType) {
    if (newType != null && newType != _selectedVoltageType) {
      _selectedVoltageType = newType;
      notifyListeners();
    }
  }

  void _initListeners() {
    HSPController.addListener(notifyListeners);
    kbController.addListener(notifyListeners);
    kcController.addListener(notifyListeners);
    kvController.addListener(notifyListeners);
    kaController.addListener(notifyListeners);
    numDiasController.addListener(notifyListeners);
    profundidadController.addListener(notifyListeners);
  }

  void updateValues() {
    notifyListeners();
  }
}