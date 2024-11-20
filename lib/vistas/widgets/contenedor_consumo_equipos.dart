import 'package:flutter/material.dart';

class ContenedorConsumoEquipos extends StatelessWidget {
  const ContenedorConsumoEquipos({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.loose,
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
                ListView(
                  shrinkWrap: true,
                  children: const [
                    ListTile(
                      title: Text('Item 1'),
                    ),
                    ListTile(
                      title: Text('Item 2'),
                    ),
                    // Agrega más ListTile según sea necesario
                  ],
                ),

              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Consumo de equipos AC',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: const [
                    ListTile(
                      title: Text('Item A'),
                    ),
                    ListTile(
                      title: Text('Item B'),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
