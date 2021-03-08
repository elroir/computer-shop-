import 'package:design_patterns/factory/productos/boton_abstracto.dart';
import 'package:flutter/cupertino.dart';

class BotonIos implements BotonAbstracto{

  @override
  Widget dibujar(Function onPressed,String text) {
    return CupertinoButton(
        child: Text(text),
        onPressed: onPressed
    );
  }



}