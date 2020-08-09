import 'package:flutter/material.dart';
import '../constants.dart';

class ContainerContents extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final ImageProvider img1;
  final ImageProvider img2;
  final ImageProvider img3;
  final ImageProvider img4;
  final Function onClick1;
  final Function onClick2;
  final Function onClick3;
  final Function onClick4;
  ContainerContents(
      {this.img1,
      this.img2,
      this.img3,
      this.img4,
      this.onClick1,
      this.onClick2,
      this.onClick3,
      this.onClick4,
      this.text1,
      this.text2,
      this.text3,
      this.text4});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ContentPalette(
                showText: text1,
                img: img1,
                onClick: onClick1,
                bgcolor: themeYellow,
                txtcolor: Colors.white,
              ),
              ContentPalette(
                showText: text2,
                img: img2,
                onClick: onClick2,
                bgcolor: themeYellow,
                txtcolor: Colors.white,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ContentPalette(
                showText: text3,
                img: img3,
                onClick: onClick3,
                bgcolor: themeYellow,
                txtcolor: Colors.white,
              ),
              ContentPalette(
                showText: text4,
                img: img4,
                onClick: onClick4,
                bgcolor: themeYellow,
                txtcolor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContentPalette extends StatelessWidget {
  final Function onClick;
  final String showText;
  final ImageProvider img;
  final Color bgcolor;
  final Color txtcolor;
  ContentPalette(
      {this.showText, this.img, this.onClick, this.bgcolor, this.txtcolor});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onClick,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: bgcolor,
            ),
            child: ClipRRect(
              child: Image(
                image: img,
                width: 56,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          showText,
          style: TextStyle(color: txtcolor),
        ),
      ],
    );
  }
}
