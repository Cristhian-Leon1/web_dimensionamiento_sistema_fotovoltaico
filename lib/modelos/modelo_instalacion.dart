
class ModeloInstalacion {
  String? departamento;
  String? municipio;
  String? aplicacion;
  String? utilizacion;
  double? voltajeDC;
  double? voltajeAC;
  String? ampliaciones;
  int? numAdultos;
  int? numNinos;
  int? numJovenes;

  ModeloInstalacion({
    this.departamento,
    this.municipio,
    this.aplicacion,
    this.utilizacion,
    this.voltajeDC,
    this.voltajeAC,
    this.ampliaciones,
    this.numAdultos,
    this.numNinos,
    this.numJovenes,
  });

  void imprimirDatos() {
    print('Departamento: $departamento');
    print('Municipio: $municipio');
    print('Aplicación: $aplicacion');
    print('Utilización: $utilizacion');
    print('Voltaje DC: $voltajeDC');
    print('Voltaje AC: $voltajeAC');
    print('Ampliaciones: $ampliaciones');
    print('Número de adultos: $numAdultos');
    print('Número de niños: $numNinos');
    print('Número de jóvenes: $numJovenes');
  }
}