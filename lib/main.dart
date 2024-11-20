import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/providers/provider_consumo_AC.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/vistas/pagina_inicio.dart';
import 'package:web_dimensionamiento_sistema_fotovoltaico/providers/provider_inicio.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderInicio()),
        ChangeNotifierProvider(create: (_) => ProviderConsumoAC()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dimensionamiento fotovoltaico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/datos_tecnicos',
      routes: {
        '/datos_tecnicos': (context) => const PaginaInicio(),
      },
    );
  }
}