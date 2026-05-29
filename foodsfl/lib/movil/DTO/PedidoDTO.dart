import 'package:foodsfl/movil/DTO/MesasDTO.dart';
import 'package:foodsfl/movil/DTO/PedidoItemDTO.dart';

class PedidoDTO {
 int? idPedido;
  Mesasdto? mesas;
 List<PedidoItemDTO>? items;

  PedidoDTO({
     this.mesas,
     this.items,
  });

  Map<String, dynamic> toJson() {

    return {
      "mesas": mesas?.toJson(),
      "items": items?.map((e) => e.toJson()).toList(),
    };
  }
}





