import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double textHorizontalPadding;
  final double textVerticalPadding;
  final double extHorizontalPadding;
  final Color colorWeWant;
  final double extVerticalPadding;
  RoundedButton({@required this.textVerticalPadding,@required this.extVerticalPadding,this.onPressed,this.title, @required this.textHorizontalPadding, @required this.extHorizontalPadding,@required this.colorWeWant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: extVerticalPadding, horizontal: extHorizontalPadding),
      child: Material(
        color: colorWeWant,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          height: 42.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: textHorizontalPadding,vertical: textVerticalPadding),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
