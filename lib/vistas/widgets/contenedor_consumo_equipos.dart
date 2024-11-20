import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/card_equipos.dart';
import '../../providers/provider_inicio.dart';
import 'boton_personalizable.dart';

class ContenedorConsumoEquipos extends StatelessWidget {
  const ContenedorConsumoEquipos({super.key});

  @override
  Widget build(BuildContext context) {
    final providerInicio = Provider.of<ProviderInicio>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Consumo de equipos DC',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: providerInicio.equipos.length,
            itemBuilder: (context, index) {
              return CardEquipos(data: providerInicio.equipos[index], index: index);
            },
          ),
          BotonComun(
            color: Colors.blueGrey,
            text: 'AÑADIR EQUIPO',
            onPressed: () {
              providerInicio.addEquipo();
            },
          ),
        ],
      ),
    );
  }
}