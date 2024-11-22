import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/dropdownd.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/textfield_reutilizable.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/widget_variable_fija.dart';

import '../providers/provider_calculos.dart';

class ContenedorEnergiaAcumulador extends StatelessWidget {
  const ContenedorEnergiaAcumulador({super.key});

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
                            child: ContenedorVariable(
                              labelText: 'Energía diaria (Wh/día):',
                              valueNotifier: ValueNotifier(providerCalculos.energiaDiaria),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: DropdownWidget(
                                labelText: 'Voltaje nominal del sistema (V):',
                                hintText: 'Voltaje nominal',
                                value: providerCalculos.selectedVoltageType,
                                options: const ['Voltaje DC', 'Voltaje AC'],
                                onChanged: (newType) {
                                  providerCalculos.setSelectedVoltageType(newType);
                                },
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
                            child: ContenedorVariable(
                              labelText: 'Capacidad total del sistema (Ah):',
                              valueNotifier: ValueNotifier(providerCalculos.capacidadSistema),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              ],
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
                            child: ContenedorVariable(
                              labelText: 'Capacidad util de acumulador (Ah):',
                              valueNotifier: ValueNotifier(providerCalculos.capacidadUtil),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  labelText: 'Temperatura minima de trabajo (°C):',
                                  hintText: '...',
                                  controller: providerCalculos.tempMinController
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: SizedBox(height: 80)
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              ],
                            ),
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
