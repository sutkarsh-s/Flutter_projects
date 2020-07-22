import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_container.dart';
import 'red_button.dart';
import 'bottom_bar.dart';

class SalonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundBlack,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kBackgroundBlack,
          title: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.reply,
                  color: Colors.black,
                ),
              ),
              Center(
                child: Text(
                  'SALON X',
                ),
              ),
            ],
          )),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomContainer(
              customChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'images/test_image.png',
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: kBookAppointmentDecoration,
                      child: Text('BOOK AN APPOINTMENT'),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: RoundedButton(
                                textVerticalPadding: 10,
                                extVerticalPadding: 0,
                                colorWeWant: kBrownWeWant,
                                title: 'SUNDAY',
                                textHorizontalPadding: 15,
                                extHorizontalPadding: 18),
                          ),
                          Expanded(
                            flex: 1,
                            child: RoundedButton(
                              textVerticalPadding: 10,
                              extVerticalPadding: 5,
                              colorWeWant: kRedWeWant,
                              title: 'JULY 20',
                              textHorizontalPadding: 0,
                              extHorizontalPadding: 18,
                            ),
                          ),
                        ],
                      ),
                      RoundedButton(
                        textVerticalPadding: 0,
                        extVerticalPadding: 10,
                        colorWeWant: Colors.black,
                        title: '6:00 PM',
                        textHorizontalPadding: 20,
                        extHorizontalPadding: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            RoundedButton(
              extVerticalPadding: 20,
              textVerticalPadding: 5,
              colorWeWant: kRedWeWant,
              extHorizontalPadding: 80.0,
              title: 'Continue',
              textHorizontalPadding: 20,
              onPressed: () {},
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
