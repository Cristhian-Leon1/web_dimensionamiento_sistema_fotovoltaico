import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/card_equipos.dart';
import '../providers/provider_inicio.dart';
import 'widgets/boton_personalizable.dart';

class ContenedorConsumoEquipos extends StatelessWidget {
  final bool isAC;

  const ContenedorConsumoEquipos({required this.isAC, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderInicio>(context);

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
            itemCount: isAC ? provider.equiposAC.length : provider.equiposDC.length,
            itemBuilder: (context, index) {
              return CardEquipos(
                data: isAC ? provider.equiposAC[index] : provider.equiposDC[index],
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
                provider.addEquipoAC();
              } else {
                provider.addEquipoDC();
              }
            },
          ),
          ValueListenableBuilder<double>(
            valueListenable: isAC ? provider.consumoTotalDiarioAC : provider.consumoTotalDiarioDC,
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
