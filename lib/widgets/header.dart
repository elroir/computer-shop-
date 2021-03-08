import 'package:design_patterns/constants.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget {

  final String text;

  const Header({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * 0.15,
      child: Container(
        padding: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: 36 + kDefaultPadding,
        ),
        height: size.height * 0.2 - 27,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(36),
          ),
        ),
        child: Row(
          children: <Widget>[
            Text(
              text,
              style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    );
  }
}