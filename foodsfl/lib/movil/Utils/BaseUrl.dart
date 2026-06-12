class Baseurl {

 static final String baseUrl = 'http://192.168.1.132:8080';
  static final String consultarMesas = '/Mesas/listar/mesas';
 static final String consultarSubMenu = '/submenu/traer/submenus';
 static String consultarRestaurante(int id) =>
    '/restaurante/traer/menuTodo/$id';
  static final String registrarPedido = '/Pedido/pedido';
  static final String consultarProducto = '/producto/listar/productos';

static final String consultarSubmenus = '/submenu/listar/submenus';


  static final String actualizarProducto = '/productos/actualizar';
  static final String registrarProducto = '/productos/registrarProductos';
  static final String consultarCategoria = '/categoria/traerporAll';
  static final String consultarStock = '/stock/traerporAll';
  static final String registrarStock = '/stock/registrarStock';
  static final String actualizarStock = '/stock/actualizar';
  static final String consultarStockId = '/stock/traerporId/{id}';
}