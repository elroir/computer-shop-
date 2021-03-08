import 'package:design_patterns/factory/productos/alerta_abstracta.dart';
import 'package:flutter/material.dart';

class AlertaAndroid implements AlertaAbstracta{
  @override
  void dibujar(List<Widget> actions,BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            AlertDialog(
              title: Text('Finalizar'),
              content: Text('¿Estas seguro de querer finalizar la compra?'),
              actions: actions
            )
    );
  }

}