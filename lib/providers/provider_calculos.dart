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
  final TextEditingController tempMinController = TextEditingController();
  final TextEditingController nominalBateriaController = TextEditingController();
  final TextEditingController capacidadNominalBateriaController = TextEditingController();
  final TextEditingController rendimientoReguladorController = TextEditingController();
  final TextEditingController rendimientoPanelController = TextEditingController();
  final TextEditingController voltajeNominalPanelController = TextEditingController();
  final TextEditingController potenciaPicoPanelController = TextEditingController();
  final TextEditingController iccNominalPanelController = TextEditingController();
  final TextEditingController iPicoPanelController = TextEditingController();
  final TextEditingController rendimientoInversorController = TextEditingController();

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

  double get capacidadSistema {
    final capacidadUtil = this.capacidadUtil;
    final profundidad = double.tryParse(profundidadController.text) ?? 0;
    final tempMin = double.tryParse(tempMinController.text) ?? 0;
    return capacidadUtil / (profundidad + ((1 - (20 - tempMin)) / 160));
  }

  double get numBaterias {
    final voltaje = selectedVoltageType == 'Voltaje DC'
        ? providerInicio.instalacion.voltajeDC
        : providerInicio.instalacion.voltajeAC;
    final voltajeBateria = double.tryParse(nominalBateriaController.text) ?? 1.0; // Default to 1.0 to avoid division by zero

    if (voltaje == null || voltajeBateria == 0) {
      return 0.0;
    }

    return voltaje / voltajeBateria;
  }

  double get bateriasParalelo {
    final capacidadSistema = this.capacidadSistema;
    final capacidadNominalBateria = double.tryParse(capacidadNominalBateriaController.text) ?? 1.0; // Default to 1.0 to avoid division by zero
    if (capacidadSistema == 0 || capacidadNominalBateria == 0) {
      return 0.0;
    }
    return (capacidadSistema / capacidadNominalBateria).ceilToDouble();
  }

  double get totalBaterias {
    return numBaterias * bateriasParalelo;
  }

  double get capacidadTotalSistema {
    return bateriasParalelo * (double.tryParse(capacidadNominalBateriaController.text) ?? 0.0);
  }

  double get potenciaPanel {
    if (energiaDiaria == 0) {
      return 0.0;
    }
    return energiaDiaria / ((double.tryParse(rendimientoReguladorController.text) ?? 0.0) / 100);
  }

  double get potenciaNominalPanel {
    if (potenciaPanel == 0 || HSPValue == 0) {
      return 0.0;
    }
    return potenciaPanel / (HSPValue * ((double.tryParse(rendimientoPanelController.text) ?? 0.0) / 100));
  }

  get panelesSerie {
    final voltaje = selectedVoltageType == 'Voltaje DC'
        ? providerInicio.instalacion.voltajeDC
        : providerInicio.instalacion.voltajeAC;
    final voltajeNominalPanel = double.tryParse(voltajeNominalPanelController.text) ?? 0.0;
    if (voltajeNominalPanel == 0 || voltaje == null) {
      return 0;
    }
    return (voltaje / voltajeNominalPanel).ceilToDouble();
  }

  get panelesParalelo {
    if (potenciaNominalPanel == 0 || panelesSerie == 0) {
      return 0.0;
    }
    return (potenciaNominalPanel / (panelesSerie * (double.tryParse(potenciaPicoPanelController.text) ?? 0.0))).ceilToDouble();
  }

  get totalPaneles {
    if (panelesSerie == 0 || panelesParalelo == 0) {
      return 0.0;
    }
    return panelesSerie * panelesParalelo;
  }

  get potenciaNominalInstalada {
    if (totalPaneles == 0) {
      return 0.0;
    }
    return totalPaneles * (double.tryParse(potenciaPicoPanelController.text) ?? 0.0);
  }

  get iccGenerador {
    if (panelesParalelo == 0) {
      return 0.0;
    }
    return panelesParalelo * (double.tryParse(iccNominalPanelController.text) ?? 0.0);
  }

  get iPicoGenerador {
    if (panelesParalelo == 0) {
      return 0.0;
    }
    return panelesParalelo * (double.tryParse(iPicoPanelController.text) ?? 0.0);
  }

  get iEntradaRegulador {
    if (iPicoGenerador == 0) {
      return 0.0;
    }
    return iPicoGenerador * (1 + 0.25);
  }

  void _initListeners() {
    HSPController.addListener(notifyListeners);
    kbController.addListener(notifyListeners);
    kcController.addListener(notifyListeners);
    kvController.addListener(notifyListeners);
    kaController.addListener(notifyListeners);
    numDiasController.addListener(notifyListeners);
    profundidadController.addListener(notifyListeners);
    tempMinController.addListener(notifyListeners);
    nominalBateriaController.addListener(notifyListeners);
    capacidadNominalBateriaController.addListener(notifyListeners);
    rendimientoReguladorController.addListener(notifyListeners);
    rendimientoPanelController.addListener(notifyListeners);
    voltajeNominalPanelController.addListener(notifyListeners);
    potenciaPicoPanelController.addListener(notifyListeners);
    iccNominalPanelController.addListener(notifyListeners);
    iPicoPanelController.addListener(notifyListeners);
    rendimientoInversorController.addListener(notifyListeners);
  }

  void updateValues() {
    notifyListeners();
  }
}