import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/textfield_reutilizable.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/widget_variable_fija.dart';

import '../providers/provider_calculos.dart';

class ContenedorPaneles extends StatelessWidget {
  const ContenedorPaneles({super.key});


  @override
  Widget build(BuildContext context) {
    final providerCalculos = Provider.of<ProviderCalculos>(context);

    return SingleChildScrollView(
        child: Row(
            children: [
              Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: CustomTextField(
                                  labelText: 'Rendimiento del regulador (%):',
                                  hintText: '...',
                                  controller: providerCalculos.rendimientoReguladorController
                                )
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ContenedorVariable(
                                  labelText: 'Potencia del generador (Wh):',
                                  valueNotifier: ValueNotifier(providerCalculos.potenciaPanel),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: CustomTextField(
                                  labelText: 'Voltaje nominal panel (V):',
                                  hintText: '...',
                                  controller: providerCalculos.voltajeNominalPanelController
                                )
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ContenedorVariable(
                                  labelText: 'Modulos en serie:',
                                  valueNotifier: ValueNotifier(providerCalculos.panelesSerie),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child:
                                ContenedorVariable(
                                  labelText: 'Número total de paneles:',
                                  valueNotifier: ValueNotifier(providerCalculos.totalPaneles),
                                )
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child:
                                ContenedorVariable(
                                  labelText: 'Potencia nominal instalada:',
                                  valueNotifier: ValueNotifier(providerCalculos.potenciaNominalInstalada),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child:
                                CustomTextField(
                                    labelText: 'Corriente pico panel (A):',
                                    hintText: '...',
                                    controller: providerCalculos.iPicoPanelController
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child:
                                ContenedorVariable(
                                  labelText: 'Corriente pico generador (A):',
                                  valueNotifier: ValueNotifier(providerCalculos.iPicoGenerador),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: CustomTextField(
                                    labelText: 'Rendimiento del panel (%):',
                                    hintText: '...',
                                    controller: providerCalculos.rendimientoPanelController
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ContenedorVariable(
                                  labelText: 'Potencia nominal del generador (W):',
                                  valueNotifier: ValueNotifier(providerCalculos.potenciaNominalPanel),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: CustomTextField(
                                  labelText: 'Potencia pico del panel (Wp):',
                                  hintText: '...',
                                  controller: providerCalculos.potenciaPicoPanelController
                                )
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ContenedorVariable(
                                  labelText: 'Número paneles en paralelo:',
                                  valueNotifier: ValueNotifier(providerCalculos.panelesParalelo),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child:
                                CustomTextField(
                                    labelText: 'Icc nominal del panel (A):',
                                    hintText: '...',
                                    controller: providerCalculos.iccNominalPanelController
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child:
                                ContenedorVariable(
                                  labelText: 'Icc generador (A):',
                                  valueNotifier: ValueNotifier(providerCalculos.iccGenerador),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child:
                                    ContenedorVariable(
                                      labelText: 'Corriente entrada regulador (A):',
                                      valueNotifier: ValueNotifier(providerCalculos.iEntradaRegulador),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Column(
                                  children: [],
                                )
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
              )
            ]
        )
    );
  }
}
