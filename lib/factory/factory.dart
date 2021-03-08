import 'package:design_patterns/factory/productos/alerta_abstracta.dart';
import 'package:design_patterns/factory/productos/boton_abstracto.dart';


abstract class Factory{

  AlertaAbstracta crearAlerta();

  BotonAbstracto crearBoton();

}