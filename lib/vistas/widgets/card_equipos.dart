import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/textfield_reutilizable.dart';
import '../../providers/provider_inicio.dart' as inicio;

class CardEquipos extends StatelessWidget {
  final dynamic data;
  final int index;
  final bool isAC;

  const CardEquipos({required this.data, required this.index, required this.isAC, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<inicio.ProviderInicio>(context, listen: false);

    return Card(
      color: Colors.grey[200],
      elevation: 3,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  labelText: 'Zona:',
                  hintText: '...',
                  controller: data.zonaController,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  labelText: 'Equipo:',
                  hintText: '...',
                  controller: data.equipoController,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  labelText: 'Cantidad:',
                  hintText: '...',
                  controller: data.cantidadController,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  labelText: 'Potencia (W):',
                  hintText: '...',
                  controller: data.potenciaController,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  labelText: 'Tiempo H/Día:',
                  hintText: '...',
                  controller: data.tiempoController,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Potencia total (W):',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ValueListenableBuilder<double>(
                      valueListenable: data.potenciaTotal,
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Center(
                            child: Text(
                              '$value',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Consumo W/Día:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ValueListenableBuilder<double>(
                      valueListenable: data.consumoDiario,
                      builder: (context, value, child) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Center(
                            child: Text(
                              '$value',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      if (isAC) {
                        provider.removeEquipoAC(index);
                      } else {
                        provider.removeEquipoDC(index);
                      }
                    },
                    icon: const Icon(Icons.delete_forever_outlined, size: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}