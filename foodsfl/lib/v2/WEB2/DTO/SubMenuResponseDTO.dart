class Submenuresponsedto {
   final int idSubmen;
  final String nombre;


  Submenuresponsedto({
    required this.idSubmen,
    required this.nombre,
  });

  factory Submenuresponsedto.fromJson(Map<String, dynamic> json) {
    return Submenuresponsedto(
      idSubmen: json['idSubmen'],
      nombre: json['nombre'],
      
    );
  }
}
