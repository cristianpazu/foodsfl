class CarritoItemDTO {

  final int idProducto;
  final String nombre;
  final int precio;
  int cantidad;

  CarritoItemDTO({
    required this.idProducto,
    required this.nombre,
    required this.precio,
    required this.cantidad,
  });
CarritoItemDTO copyWith({

    int? idProducto,

    String? nombre,

    int? precio,

    int? cantidad,

  }) {

    return CarritoItemDTO(

      idProducto:
          idProducto ?? this.idProducto,

      nombre:
          nombre ?? this.nombre,

      precio:
          precio ?? this.precio,

      cantidad:
          cantidad ?? this.cantidad,
    );
  }




  int get total => precio * cantidad;
}