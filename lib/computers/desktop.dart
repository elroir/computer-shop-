import 'package:design_patterns/computers/computer.dart';
import 'package:design_patterns/providers/parts.dart';

class Desktop extends Computadora{


  @override
  double calculoPrecioFinal() {

    final ensamblaje = 20.0;

    double precioFinal = this.precio;

    Parts.instance.parts.forEach((part) {
      if (part.name==this.tarjetaMadre){
        precioFinal= precioFinal + part.price;
      }else if (part.name==this.cpu){
        precioFinal+=part.price;
      }else if (part.name==this.gpu){
        precioFinal+=part.price;
      }else if (part.name==this.almacenamiento){
        precioFinal+=part.price;
      }else if (part.name==this.ram){
        precioFinal+=part.price;
      }
    });

    precioFinal+=ensamblaje;

    return precioFinal;

  }




}