import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/boton_personalizable.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/dropdownd.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/textfield_reutilizable.dart';
import '../providers/provider_inicio.dart';

class ContenedorDatosTecnicos extends StatelessWidget {
  const ContenedorDatosTecnicos({super.key});

  @override
  Widget build(BuildContext context) {
    final providerInicio = Provider.of<ProviderInicio>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ubicación:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: DropdownWidget(
                                labelText: 'Departamento',
                                hintText: 'Departamento',
                                value: providerInicio.tempInstalacion.departamento,
                                options: providerInicio.departamentos,
                                onChanged: (nuevoDepartamento) {
                                  providerInicio.seleccionarDepartamento(nuevoDepartamento);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: DropdownWidget(
                                labelText: 'Municipio',
                                hintText: 'Municipio',
                                value: providerInicio.tempInstalacion.municipio,
                                options: providerInicio.municipios,
                                onChanged: (nuevoMunicipio) {
                                  providerInicio.seleccionarMunicipio(nuevoMunicipio);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: DropdownWidget(
                                labelText: 'Aplicación',
                                hintText: 'Tipo de instalación',
                                value: providerInicio.tempInstalacion.aplicacion,
                                options: const ['Vivienda', 'Edificio', 'Finca'],
                                onChanged: (nuevaAplicacion) {
                                  providerInicio.seleccionarAplicacion(nuevaAplicacion);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: DropdownWidget(
                                labelText: 'Utilización',
                                hintText: 'Tipo de utilización',
                                value: providerInicio.tempInstalacion.utilizacion,
                                options: const ['Diario', 'Medio día', 'Fin de semana'],
                                onChanged: (nuevaUtilizacion) {
                                  providerInicio.seleccionarUtilizacion(nuevaUtilizacion);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CustomTextField(
                                labelText: 'Receptores DC (V):',
                                hintText: 'Ingrese el voltaje DC',
                                controller: providerInicio.voltajeDController,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: CustomTextField(
                                labelText: 'Receptores AC (V):',
                                hintText: 'Ingrese el voltaje AC',
                                controller: providerInicio.voltajeAController,
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
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: CustomTextField(
                              labelText: 'Número de adultos:',
                              hintText: 'Cantidad de adultos',
                              controller: providerInicio.adultosController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CustomTextField(
                              labelText: 'Número de jovenes:',
                              hintText: 'Cantidad de jovenes',
                              controller: providerInicio.jovenesController,
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
                              labelText: 'Número de niños:',
                              hintText: 'Cantidad de niños',
                              controller: providerInicio.ninosController,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Column(
                              children: [],
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
                            child: DropdownWidget(
                              labelText: 'Ampliaciones',
                              hintText: 'Ampliaciones futuras',
                              value: providerInicio.ampliacionesFuturas,
                              options: const ['Sí', 'No'],
                              onChanged: (nuevaOpcion) {
                                providerInicio.seleccionarAmpliacionesFuturas(nuevaOpcion);
                              },
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Column(
                              children: [],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Flexible(
            fit: FlexFit.loose,
            child: BotonComun(
              color: Colors.blueGrey,
              text: 'SALVAR DATOS',
              onPressed: () {
                providerInicio.guardarDatos();
              },
            ),
          ),
        ],
      ),
    );
  }
}