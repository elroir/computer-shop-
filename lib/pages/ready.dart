import 'package:design_patterns/constants.dart';
import 'package:flutter/material.dart';

class ReadyPage extends StatefulWidget {
  @override
  _ReadyPageState createState() => _ReadyPageState();
}

class _ReadyPageState extends State<ReadyPage> {


  double _args;

  @override
  Widget build(BuildContext context) {

    _args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Compra exitosa'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Gracias por tu compra!'),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor)
                  ),
                  child: Text('Volver'),
                  onPressed: () => Navigator.popUntil(context, (route) => route.isFirst)
                )
              ]
            ),
          ),
          Align(
           alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("TOTAL: \$$_args ", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                ) ,
              ),
            )
          )
        ],
      ),
    );
  }

}
