import 'dart:io';

import 'package:design_patterns/factory/fabricas_concretas/android_factory.dart';
import 'package:design_patterns/factory/fabricas_concretas/ios_factory.dart';
import 'package:design_patterns/factory/factory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Computadora {

  String _tarjetaMadre;
  String _cpu;
  String _gpu;
  String _ram;
  String _almacenamiento;
  double _precio;

  void setGpu(String gpu) {
    this._gpu = gpu;
  }

  String get gpu => this._gpu;

  void setCpu(String cpu) {
    this._cpu = cpu;
  }

  double get precio => this._precio;

  void setPrecio(double precio) {
    this._precio = precio;
  }

  String get cpu => this._cpu;

  void setTarjetaMadre(String tarjetaMadre) {
    this._tarjetaMadre = tarjetaMadre;
  }

  String get tarjetaMadre => this._tarjetaMadre;

  void setRam(String ram) {
    this._ram = ram;
  }

  String get ram => this._ram;

  String get almacenamiento => this._almacenamiento;

  void setAlmacenamiento(String almacenamiento) {
    this._almacenamiento = almacenamiento;
  }

  double calculoPrecioFinal();

  void configurar(BuildContext context, String mobo, String cpu, String gpu,
      String ram, String almacenamiento,double precio) {
    this._tarjetaMadre = mobo;
    this._cpu = cpu;
    this._gpu = gpu;
    this._ram = ram;
    this._almacenamiento = almacenamiento;

    this._precio = precio;
    this._precio = calculoPrecioFinal();

    Factory factory;

    if (Platform.isIOS) {
      factory = new IosFactory();
      factory.crearAlerta().dibujar(
          [
            factory.crearBoton().dibujar(() => Navigator.of(context).pop(),'Volver'),
            factory.crearBoton().dibujar(() => Navigator.pushReplacementNamed(
                context, 'ready', arguments: this._precio),'Continuar')
          ],
        context
      );
    } else {
      factory = new AndroidFactory();
      factory.crearAlerta().dibujar(
          [
            factory.crearBoton().dibujar(() => Navigator.of(context).pop(),'Volver'),
            factory.crearBoton().dibujar(() => Navigator.pushReplacementNamed(
                context, 'ready', arguments:  this._precio),'Continuar')
          ],
          context
      );
    }
  }

}