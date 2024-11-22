import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/textfield_reutilizable.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/widget_variable_fija.dart';

import '../providers/provider_calculos.dart';

class ContenedorBaterias extends StatelessWidget {
  const ContenedorBaterias({super.key});


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
                            labelText: 'Voltaje nominal bateria (V):',
                            hintText: '...',
                            controller: providerCalculos.nominalBateriaController
                          )
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ContenedorVariable(
                            labelText: 'Número de baterias:',
                            valueNotifier: ValueNotifier(providerCalculos.numBaterias),
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
                            labelText: 'Número total de baterias:',
                            valueNotifier: ValueNotifier(providerCalculos.totalBaterias),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ContenedorVariable(
                            labelText: 'Capacidad total del sistema:',
                            valueNotifier: ValueNotifier(providerCalculos.capacidadTotalSistema),
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
                            labelText: 'Capacidad nominal bateria: (Ah):',
                            hintText: '...',
                            controller: providerCalculos.capacidadNominalBateriaController
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ContenedorVariable(
                            labelText: 'Baterias en paralelo (grupos):',
                            valueNotifier: ValueNotifier(providerCalculos.bateriasParalelo),
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
