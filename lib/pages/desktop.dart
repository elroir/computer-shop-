import 'package:design_patterns/models/part_model.dart';
import 'package:flutter/material.dart';

import 'package:design_patterns/computers/computer.dart';
import 'package:design_patterns/computers/desktop.dart';
import 'package:design_patterns/widgets/custom_dropdown.dart';
import 'package:design_patterns/providers/database.dart';

class DesktopView extends StatefulWidget {
  @override
  _DesktopViewState createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {

  Computadora _desktop = new Desktop();

  List<List<String>> _components;
  List<String> _componentSelected;
  List<String> _names;
  bool sw;

  @override
  void initState() {
    _names = ['Cpu','Tarjeta de video','Almacenamiento','Ram','Tarjeta madre'];
    _components = List.generate(5, (i) => []);
    sw = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Database.getParts(),
      builder: (BuildContext context,AsyncSnapshot<List<PartModel>> snapshot) {
        if (snapshot.hasData){

          if (!sw){
            snapshot.data.forEach((element) {
              switch (element.type) {
                case 'cpu':
                  _components[0].add(element.name);
                break;
                case 'gpu':
                  _components[1].add(element.name);
                break;
                case 'storage':
                  _components[2].add(element.name);
                break;
                case 'ram':
                  _components[3].add(element.name);
                break;
                default:
                  _components[4].add(element.name);
                break;
              }

            });
            for (int i = 0 ; i < _components.length ; i++){
              _componentSelected = List.generate(5, (i) => _components[i].first);
              sw = true;
            }
          }


          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/desktop.png',fit: BoxFit.fitWidth,),
              _buildOption(_components,_componentSelected,_names),
              ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.black45),
                    shape: MaterialStateProperty.all(StadiumBorder())
                ),
                onPressed: () {
                  _desktop.configurar(context,_componentSelected[4],_componentSelected[0],_componentSelected[1],_componentSelected[3],_componentSelected[2],0);
                },
                child: Text('Configurar',style: TextStyle(fontSize: 20.0),),

              ),

            ],

          );
        }else{
          return Center(child: CircularProgressIndicator());
        }


      }
    );
  }

  Widget _buildOption(List<List<String>> parts,List<String> part,List<String> names) {

    List<Widget> list = [];

    for (int i = 0 ; i < parts.length ; i++){
      list.add(
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(names[i]),
                CustomDropdown(
                    items: parts[i] , item: part[i],
                    onChanged: (opt) {
                      setState(() {
                        part[i] = opt;
                      });
                    }
                ),
              ],
            ),
          )
      );
    }


    return Column(
      children: list,
    );
  }

}
