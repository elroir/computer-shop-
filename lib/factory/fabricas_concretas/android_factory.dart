import 'package:design_patterns/factory/factory.dart';
import 'package:design_patterns/factory/productos/alerta_abstracta.dart';
import 'package:design_patterns/factory/productos/alertas/alerta_android.dart';
import 'package:design_patterns/factory/productos/boton_abstracto.dart';
import 'package:design_patterns/factory/productos/botones/boton_android.dart';

class AndroidFactory implements Factory{
  @override
  AlertaAbstracta crearAlerta() {
    return AlertaAndroid();
  }

  @override
  BotonAbstracto crearBoton() {
    return BotonAndroid();
  }

}