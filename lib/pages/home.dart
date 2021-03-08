import 'package:design_patterns/pages/desktop.dart';
import 'package:design_patterns/providers/parts.dart';
import 'package:flutter/material.dart';

import 'package:design_patterns/constants.dart';
import 'package:design_patterns/models/laptop_model.dart';
import 'package:design_patterns/providers/database.dart';
import 'package:design_patterns/widgets/custom_title.dart';
import 'package:design_patterns/widgets/header.dart';
import 'package:design_patterns/widgets/laptop_card.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(text: 'Computer world',),
            CustomTitle(title: "Laptops"),
            _buildLaptops(context),
            CustomTitle(title: "Arma tu PC"),
            DesktopView(),
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),

    );
  }

  Widget _buildLaptops(BuildContext context){

    final size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: Database.getLaptops(),
        builder: (BuildContext context,AsyncSnapshot<List<LaptopModel>> snapshot) {
          if (snapshot.hasData)
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  snapshot.data.length,
                  (i) =>
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 300,
                      minWidth: 200
                    ),
                    child: LaptopCard(
                      image:  NetworkImage(snapshot.data[i].pictureUrl) ,
                      model: snapshot.data[i].model,
                      make: snapshot.data[i].make,
                      onPressed: () async {
                        final configuration = await Database.getConfigurations(snapshot.data[i].objectId);
                        List<dynamic> arguments = [snapshot.data[i].make,snapshot.data[i].model,configuration];
                        Parts.instance.imageUrl = snapshot.data[i].pictureUrl;
                        Navigator.pushNamed(context, 'detail',arguments: arguments);
                      },
                    ),
                  )
                ),
              )
            );
          else
            return SizedBox(height: size.height*0.3,child: Center(child: CircularProgressIndicator()));

        }
    );
  }
}
