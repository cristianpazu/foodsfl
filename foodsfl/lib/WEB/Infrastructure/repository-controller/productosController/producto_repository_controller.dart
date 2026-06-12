import 'package:foodsfl/WEB/DTO/ProductoResponseDTO.dart';
import 'package:foodsfl/WEB/Domain/repositories/productoRepositories/productoRepositories.dart';
import 'package:foodsfl/WEB/Infrastructure/datasource-ServiceIMPL/productoImpl/ProductoServiceIMPL.dart';
import 'package:foodsfl/movil/Entities/Productos.dart';

class ProductoRepositoryController extends Productorepositories {
  final Productoserviceimpl productoserviceimpl;

  ProductoRepositoryController(this.productoserviceimpl);

  
  @override
  Future<List<ProductoResponseDTO>> consultarProductos() {
   return productoserviceimpl.consultarProductos();
  }
}
