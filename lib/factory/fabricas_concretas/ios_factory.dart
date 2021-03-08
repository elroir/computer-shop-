import 'package:design_patterns/factory/factory.dart';
import 'package:design_patterns/factory/productos/alerta_abstracta.dart';
import 'package:design_patterns/factory/productos/alertas/alerta_ios.dart';
import 'package:design_patterns/factory/productos/boton_abstracto.dart';
import 'package:design_patterns/factory/productos/botones/boton_ios.dart';


class IosFactory implements Factory{
  @override
  AlertaAbstracta crearAlerta() {
    return AlertaIos();
  }

  @override
  BotonAbstracto crearBoton() {
    return BotonIos();
  }

}