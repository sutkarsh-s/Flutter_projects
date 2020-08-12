import 'package:baarbo/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/main_drawer.dart';
import '../extra-files/red_button.dart';
import '../extra-files/custom_container.dart';
import '../screens/tabs_screen.dart';
// import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:provider/provider.dart';
// import '../providers/products.dart';

class SalonScreen extends StatefulWidget {
  static const routeName = '/salon-screen';

  @override
  _SalonScreenState createState() => _SalonScreenState();
}

class _SalonScreenState extends State<SalonScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != null && picked != _time) {
      print('Time selected: ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final optionId =
    //     ModalRoute.of(context).settings.arguments as String; // is the id!
    // final loadedProduct = Provider.of<Products>(
    //   context,
    //   listen: false,
    // ).findById(optionId);
    String day = DateFormat('EEEE').format(selectedDate);
    print(day);

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
                              flex: 1,
                              child: RoundedButton(
                                textVerticalPadding: 10,
                                extVerticalPadding: 0,
                                colorWeWant: Colors.teal[400],
                                title: day,
                                textHorizontalPadding: 15,
                                extHorizontalPadding: 18,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: RoundedButton(
                                textVerticalPadding: 10,
                                extVerticalPadding: 5,
                                colorWeWant: Colors.teal[400],
                                title: '${_time.toString()}'
                                    .split('(')[1]
                                    .split(')')[0],
                                textHorizontalPadding: 0,
                                extHorizontalPadding: 18,
                                onPressed: () => _selectTime(context),
                              ),
                            ),
                          ],
                        ),
                        RoundedButton(
                          textVerticalPadding: 0,
                          extVerticalPadding: 10,
                          colorWeWant: Colors.blue[900],
                          title: "${selectedDate.toLocal()}".split(' ')[0],
                          textHorizontalPadding: 20,
                          extHorizontalPadding: 20,
                          onPressed: () => _selectDate(context),
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
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: TabsScreen(),
      ),
    );
  }
}
