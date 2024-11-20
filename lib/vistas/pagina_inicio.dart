import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:accordion/accordion.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/providers/provider_inicio.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/contenedor_consumo_equipos.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/widgets/contenedor_datos_tecnicos.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final providerInicio = Provider.of<ProviderInicio>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'DIMENSIONAMIENTO DE SISTEMA FOTOVOLTAICO',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Accordion(
                maxOpenSections: 1,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                children: [
                  AccordionSection(
                    headerBackgroundColor: Colors.blueGrey,
                    contentBackgroundColor: Colors.grey[100],
                    isOpen: providerInicio.seccionesAbiertas[0],
                    header: const Text(
                      'Datos técnicos de la instalación y habitantes',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    content: const ContenedorDatosTecnicos(),
                    onOpenSection: () => providerInicio.alternarSeccion(0),
                  ),
                  AccordionSection(
                    headerBackgroundColor: Colors.blueGrey,
                    contentBackgroundColor: Colors.grey[300],
                    isOpen: providerInicio.seccionesAbiertas[1],
                    header: const Text(
                      'Consumo DC de equipos electrónicos por día',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    content: const ContenedorConsumoEquipos(isAC: false),
                    onOpenSection: () => providerInicio.alternarSeccion(1),
                  ),
                  AccordionSection(
                    headerBackgroundColor: Colors.blueGrey,
                    contentBackgroundColor: Colors.grey[300],
                    isOpen: providerInicio.seccionesAbiertas[2],
                    header: const Text(
                      'Consumo AC de equipos electrónicos por día',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    content: const ContenedorConsumoEquipos(isAC: true),
                    onOpenSection: () => providerInicio.alternarSeccion(2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}