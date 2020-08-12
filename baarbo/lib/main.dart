import 'package:baarbo/screens/coupons_screen.dart';
import 'package:baarbo/screens/home_overview_screen.dart';
import 'package:baarbo/screens/salons_screen.dart';
import 'package:baarbo/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:baarbo/screens/search_store_screen.dart';
import './screens/cart_screen.dart';
import './screens/settings_screen.dart';
import 'package:provider/provider.dart';
import './screens/profile_screen.dart';
import './screens/contact_screen.dart';
import './screens/home_overview_screen.dart';
import './screens/home_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/auth_screen2.dart';
import 'package:after_layout/after_layout.dart';
import './providers/options.dart';
import './widgets/option_item.dart';
import './screens/salons_screen.dart';
import './providers/prod_options.dart';
import './screens/splash_screen.dart';

//import './homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash());
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductOptions(),
        ),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Options(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
          title: 'Baarbo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                  fontSize: 40,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
          //home: SalonPage(),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.onAuthStateChanged,
              builder: (ctx, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return SplashScreen();
                }
                if (userSnapshot.hasData) {
                  //   return ProductsOverviewScreen();
                  // }
                  if (userSnapshot.data.providerData.length == 1) {
                    // logged in using email and password
                    return userSnapshot.data.isEmailVerified
                        ? ProductsOverviewScreen()
                        : AuthScreen();
                  } else {
                    // logged in using other providers
                    return ProductsOverviewScreen();
                  }
                }
                // return LoginScreen();
                return AuthScreen();
              }),
          // initialRoute: '/', // default is '/'
          routes: {
            // '/': (ctx) => LoginScreen(),
            ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            CouponsScreen.routeName: (ctx) => CouponsScreen(),
            SettingsScreen.routeName: (ctx) => SettingsScreen(),
            ContactScreen.routeName: (ctx) => ContactScreen(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            TabsScreen.routeName: (ctx) => TabsScreen(),
            SearchStore.routeName: (ctx) => SearchStore(),
            OptionItem.routeName: (ctx) => OptionItem(),
            SalonScreen.routeName: (ctx) => SalonScreen(),
            ProfileScreenTab.routeName: (ctx) => ProfileScreenTab(),
          }),
    );
  }
}
