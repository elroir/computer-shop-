
import 'package:design_patterns/factory/productos/alerta_abstracta.dart';
import 'package:flutter/cupertino.dart';

class AlertaIos implements AlertaAbstracta{
  @override
  void dibujar(List<Widget> actions,BuildContext context) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            CupertinoAlertDialog(
              title: Text('Finalizar'),
              content: Text('¿Estas seguro de querer finalizar la compra?'),
              actions: actions
            )
    );
  }

}