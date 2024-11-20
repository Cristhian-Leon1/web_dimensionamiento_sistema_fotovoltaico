import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/provider_inicio.dart' as inicio;
import '../../providers/provider_consumo_AC.dart' as ac;

class CardEquipos extends StatelessWidget {
  final dynamic data; // Use dynamic to accept both types of CardEquipoData
  final int index;
  final bool isAC;

  const CardEquipos({required this.data, required this.index, required this.isAC, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = isAC ? Provider.of<ac.ProviderConsumoAC>(context, listen: false) : Provider.of<inicio.ProviderInicio>(context, listen: false);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Zona:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: data.zonaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '...',
                      ),
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
                      'Equipo:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: data.equipoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '...',
                      ),
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
                      'Cantidad:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: data.cantidadController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Cantidad equipos',
                      ),
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
                      'Potencia (W):',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: data.potenciaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '...',
                      ),
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
                      'Tiempo H/Día:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: data.tiempoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '...',
                      ),
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
                        (provider as ac.ProviderConsumoAC).removeEquipo(index);
                      } else {
                        (provider as inicio.ProviderInicio).removeEquipo(index);
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