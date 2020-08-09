import 'package:flutter/material.dart';
import '../models/pin_pill_info.dart';

class MapPinPillComponent extends StatefulWidget {
  final double pinPillPosition;
  final PinInformation currentlySelectedPin;

  MapPinPillComponent({this.pinPillPosition, this.currentlySelectedPin});

  @override
  State<StatefulWidget> createState() => MapPinPillComponentState();
}

class MapPinPillComponentState extends State<MapPinPillComponent> {
  @override
  Widget build(BuildContext context) {
    bool _visible = true;
    return AnimatedPositioned(
      top: MediaQuery.of(context).size.height * 0.4,
      right: 0,
      left: 0,
      duration: Duration(milliseconds: 200),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            margin: EdgeInsets.all(20),
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset.zero,
                      color: Colors.grey.withOpacity(0.5))
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(left: 10),
                  child: ClipOval(
                      child: Image.asset(widget.currentlySelectedPin.avatarPath,
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.currentlySelectedPin.address,
                            style: TextStyle(
                                color: widget.currentlySelectedPin.labelColor,
                                fontSize: 12)),
                        Text(
                            'Distance: ${widget.currentlySelectedPin.distance.toString()} km',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.asset(widget.currentlySelectedPin.pinPath,
                      width: 50, height: 50),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
