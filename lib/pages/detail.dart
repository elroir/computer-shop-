import 'package:design_patterns/computers/computer.dart';
import 'package:design_patterns/computers/laptop.dart';
import 'package:design_patterns/constants.dart';
import 'package:design_patterns/models/configuration_model.dart';
import 'package:design_patterns/providers/parts.dart';
import 'package:design_patterns/widgets/header.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  List _args;
  List<ConfigurationModel> configurations;


  @override
  Widget build(BuildContext context) {

    _args = ModalRoute.of(context).settings.arguments;
    configurations = _args[2];
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccione la configuracion'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(text: '${_args[0]} ${_args[1]}',),
            Column(
              children: List.generate(
                  configurations.length,
                      (i) =>
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 500,
                          minWidth: 200,
                          minHeight: 100,
                          maxHeight: 150
                        ),
                        child: _ProductCard(configuration: configurations[i],),
                      )
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class _ProductCard extends StatelessWidget {

  final ConfigurationModel configuration;

  const _ProductCard({Key key, this.configuration}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final String gpu = (configuration.gpu==null) ? '' : configuration.gpu ;
    Computadora laptop = new Laptop();

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 130,
                minHeight: 90,
                minWidth: 120,
                maxWidth: 170
              ),
              child: FadeInImage(
                placeholder: AssetImage('assets/laptop.png'),
                  image: NetworkImage(Parts.instance.imageUrl)
              )
            )
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0,top: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${configuration.cpu} $gpu'),
                  Text('${configuration.ram}'),
                  Text('${configuration.storage}'),
                  Text('\$${configuration.price}'),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor)
                    ),
                    onPressed: (){
                      laptop.configurar(context, 'laptop mobo', configuration.cpu, configuration.gpu, configuration.ram, configuration.storage,configuration.price.toDouble());

                    },
                      child: Text('Comprar',style: TextStyle(color: Colors.white),)
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

