import 'package:design_patterns/constants.dart';
import 'package:flutter/material.dart';


class LaptopCard extends StatelessWidget {
  const LaptopCard({
    Key key,
    this.image,
    this.make,
    this.model,
    this.price,
    this.onPressed,
  }) : super(key: key);

  final String make, model;
  final int price;
  final Function onPressed;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.45,
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: 320,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10)
              )
            ),
            child: FadeInImage(
              placeholder: AssetImage('assets/laptop.png'),
              image:image,
              fit: BoxFit.fitWidth,
            )
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$make\n".toUpperCase(),
                            style: TextStyle(color: Colors.black54)),
                        TextSpan(
                          text: "$model".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Ver',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
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