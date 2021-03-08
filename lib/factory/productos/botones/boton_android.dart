import 'package:flutter/material.dart';
import 'package:design_patterns/factory/productos/boton_abstracto.dart';


class BotonAndroid implements BotonAbstracto{
  @override
  Widget dibujar(Function onPressed,String text) {
    return TextButton(
        child: Text(text,style: TextStyle(color: Colors.white),),
        onPressed: onPressed
    );
  }





}