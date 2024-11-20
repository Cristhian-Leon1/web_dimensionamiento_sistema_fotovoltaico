import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/card_equipos.dart';
import '../../providers/provider_consumo_AC.dart';
import '../../providers/provider_inicio.dart';
import 'boton_personalizable.dart';

class ContenedorConsumoEquipos extends StatelessWidget {
  final bool isAC;

  const ContenedorConsumoEquipos({required this.isAC, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = isAC ? Provider.of<ProviderConsumoAC>(context) : Provider.of<ProviderInicio>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Consumo de equipos ${isAC ? 'AC' : 'DC'}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: isAC ? (provider as ProviderConsumoAC).equipos.length : (provider as ProviderInicio).equipos.length,
            itemBuilder: (context, index) {
              return CardEquipos(
                data: isAC ? (provider as ProviderConsumoAC).equipos[index] : (provider as ProviderInicio).equipos[index],
                index: index,
                isAC: isAC,
              );
            },
          ),
          BotonComun(
            color: Colors.blueGrey,
            text: 'AÑADIR EQUIPO',
            onPressed: () {
              if (isAC) {
                (provider as ProviderConsumoAC).addEquipo();
              } else {
                (provider as ProviderInicio).addEquipo();
              }
            },
          ),
          ValueListenableBuilder<double>(
            valueListenable: isAC ? (provider as ProviderConsumoAC).consumoTotalDiario : (provider as ProviderInicio).consumoTotalDiario,
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Consumo ${isAC ? 'AC' : 'DC'} total por día: ${value.toStringAsFixed(2)} W/Día',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}