import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/main_drawer.dart';
import '../extra-files/red_button.dart';
import '../extra-files/custom_container.dart';
import '../screens/tabs_screen.dart';
// import 'package:provider/provider.dart';
// import '../providers/products.dart';

class SalonScreen extends StatelessWidget {
  static const routeName = '/salon-screen';

  @override
  Widget build(BuildContext context) {
    // final optionId =
    //     ModalRoute.of(context).settings.arguments as String; // is the id!
    // final loadedProduct = Provider.of<Products>(
    //   context,
    //   listen: false,
    // ).findById(optionId);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundBlack,
        appBar: AppBar(
            elevation: 0.0,
            // backgroundColor: kBackgroundBlack,
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.only(right: 12),
                //   child: Icon(
                //     Icons.reply,
                //     color: Colors.black,
                //   ),
                // ),
                // Center(
                //   child:
                SizedBox(
                  width: isLandscape
                      ? MediaQuery.of(context).size.width * 0.32
                      : MediaQuery.of(context).size.width * 0.15,
                ),
                Text(
                  'SALON X',
                ),
                // ),
              ],
            )),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              CustomContainer(
                customChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: isLandscape
                          ? MediaQuery.of(context).size.width * 0.2
                          : MediaQuery.of(context).size.width * 0.55,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/salon_image.jpg'),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        decoration: kBookAppointmentDecoration,
                        child: Text('BOOK AN APPOINTMENT'),
                        padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: isLandscape
                                ? MediaQuery.of(context).size.width * 0.3
                                : 60),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                extVerticalPadding: 20,
                textVerticalPadding: 5,
                colorWeWant: kRedWeWant,
                extHorizontalPadding: 50.0,
                title: 'Continue',
                textHorizontalPadding: 20,
                onPressed: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: TabsScreen(),
      ),
    );
  }
}
