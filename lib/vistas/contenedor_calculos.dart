import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/widget_variable_fija.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/textfield_reutilizable.dart';
import '../providers/provider_calculos.dart';
import '../providers/provider_inicio.dart';

class ContenedorCalculos extends StatelessWidget {
  const ContenedorCalculos({super.key});

  @override
  Widget build(BuildContext context) {
    final providerCalculos = Provider.of<ProviderCalculos>(context);
    final providerInicio = Provider.of<ProviderInicio>(context);

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
                            labelText: 'Consumo total (Et):',
                            valueNotifier: ValueNotifier(providerCalculos.consumoTotal),
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
                                labelText: 'Horas sol pico en ${providerInicio.tempInstalacion.municipio.toString().toUpperCase()}:',
                                hintText: 'Ingrese el valor de HSP',
                                controller: providerCalculos.HSPController,
                              ),
                            ],
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
                            labelText: 'Irradiancia:',
                            valueNotifier: ValueNotifier(providerCalculos.HSPValue),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ContenedorVariable(
                            labelText: 'Rendimiento de la instalación:',
                            valueNotifier: ValueNotifier(providerCalculos.rendimientoInstalacion),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
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
                          padding: const EdgeInsets.only(right: 5),
                          child: CustomTextField(
                            labelText: 'Coef. autodescarga bateria (ka):',
                            hintText: '...',
                            controller: providerCalculos.kaController,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CustomTextField(
                            labelText: 'Coef. perdidas acumulador (kb):',
                            hintText: '...',
                            controller: providerCalculos.kbController,
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
                          padding: const EdgeInsets.only(right: 5),
                          child: CustomTextField(
                            labelText: 'Coef. perdidas inversor (Kc):',
                            hintText: '...',
                            controller: providerCalculos.kcController,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CustomTextField(
                            labelText: 'Coef. perdidas instalación (kv):',
                            hintText: '...',
                            controller: providerCalculos.kvController,
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
                          padding: const EdgeInsets.only(right: 5),
                          child: CustomTextField(
                            labelText: 'Dias de autonomia bateria (N):',
                            hintText: '...',
                            controller: providerCalculos.numDiasController,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CustomTextField(
                            labelText: 'Profundidad de descarga (Pd):',
                            hintText: '...',
                            controller: providerCalculos.profundidadController,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}