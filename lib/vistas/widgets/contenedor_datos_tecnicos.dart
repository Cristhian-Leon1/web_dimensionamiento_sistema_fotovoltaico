import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/boton_personalizable.dart';
import '../../providers/provider_inicio.dart';

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
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: const Text("Departamento"),
                                value: providerInicio.tempInstalacion.departamento,
                                items: providerInicio.departamentos
                                    .map(
                                      (departamento) => DropdownMenuItem<String>(
                                    value: departamento,
                                    child: Text(departamento),
                                  ),
                                )
                                    .toList(),
                                onChanged: (nuevoDepartamento) {
                                  providerInicio.seleccionarDepartamento(nuevoDepartamento);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: const Text("Municipio"),
                                value: providerInicio.tempInstalacion.municipio,
                                items: providerInicio.municipios
                                    .map(
                                      (municipio) => DropdownMenuItem<String>(
                                    value: municipio,
                                    child: Text(municipio),
                                  ),
                                )
                                    .toList(),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Aplicación:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text("Tipo de instalación"),
                                    value: providerInicio.tempInstalacion.aplicacion,
                                    items: ['Vivienda', 'Edificio', 'Finca']
                                        .map(
                                          (aplicacion) => DropdownMenuItem<String>(
                                        value: aplicacion,
                                        child: Text(aplicacion),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (nuevaAplicacion) {
                                      providerInicio.seleccionarAplicacion(nuevaAplicacion);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Utilización:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text("Tipo de utilización"),
                                    value: providerInicio.tempInstalacion.utilizacion,
                                    items: ['Diario', 'Medio día', 'Fin de semana']
                                        .map(
                                          (utilizacion) => DropdownMenuItem<String>(
                                        value: utilizacion,
                                        child: Text(utilizacion),
                                      ),
                                    )
                                        .toList(),
                                    onChanged: (nuevaUtilizacion) {
                                      providerInicio.seleccionarUtilizacion(nuevaUtilizacion);
                                    },
                                  ),
                                ],
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Receptores DC (V):',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    controller: providerInicio.voltajeDController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'Ingrese el voltaje DC',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Receptores AC (V):',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    controller: providerInicio.voltajeAController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'Ingrese el voltaje AC',
                                    ),
                                  ),
                                ],
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Número de adultos:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextField(
                                  controller: providerInicio.adultosController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'Cantidad de adultos',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Número de jovenes:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextField(
                                  controller: providerInicio.jovenesController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'Cantidad de jovenes',
                                  ),
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
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Número de niños:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextField(
                                  controller: providerInicio.ninosController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: 'Cantidad de niños',
                                  ),
                                ),
                              ],
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ampliaciones:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  hint: const Text("Ampliaciones futuras"),
                                  value: providerInicio.ampliacionesFuturas,
                                  items: ['Sí', 'No']
                                      .map(
                                        (opcion) => DropdownMenuItem<String>(
                                      value: opcion,
                                      child: Text(opcion),
                                    ),
                                  )
                                      .toList(),
                                  onChanged: (nuevaOpcion) {
                                    providerInicio.seleccionarAmpliacionesFuturas(nuevaOpcion);
                                  },
                                ),
                              ],
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