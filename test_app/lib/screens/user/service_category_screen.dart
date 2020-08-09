// import 'package:fiklu_app/models/vehicles.dart';
// import 'package:flutter/material.dart';
// import '../../constants.dart';
// import 'service_details_screen.dart';

// class ServiceCategoryScreen extends StatefulWidget {
//   static const String id = '/servicecategoryscreen';
//   @override
//   _ServiceCategoryScreenState createState() => _ServiceCategoryScreenState();
// }

// class _ServiceCategoryScreenState extends State<ServiceCategoryScreen> {
//   VehicleService _vehicleService = VehicleService();

//   void openDetails() {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => ServiceDetailsScreen()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Image.asset('images/logo.png', width: 100),
//             Text(
//               'Service Category',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Select a Service',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//             ServiceTile(
//               text: 'Full Service',
//               onTap: () {
//                 //TODO: Full Service Action
//                 _vehicleService.serviceType = ServiceType.fullService;
//                 openDetails();
//               },
//             ),
//             ServiceTile(
//               text: 'Washing',
//               onTap: () {
//                 //TODO: Washing Action
//                 _vehicleService.serviceType = ServiceType.washing;
//                 openDetails();
//               },
//             ),
//             ServiceTile(
//               text: 'Part Service',
//               onTap: () {
//                 //TODO: Part Service Action
//                 _vehicleService.serviceType = ServiceType.partService;
//                 openDetails();
//               },
//             ),
//             ServiceTile(
//               text: 'Emergency Service',
//               onTap: () {
//                 //TODO: Emergency Action
//                 _vehicleService.serviceType = ServiceType.emergencyService;
//                 openDetails();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ServiceTile extends StatelessWidget {
//   final Function onTap;
//   final String text;
//   ServiceTile({@required this.text, this.onTap});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         children: <Widget>[
//           Icon(
//             Icons.adjust,
//             color: themeYellow,
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Text(
//             text,
//             style: TextStyle(fontSize: 20),
//           ),
//         ],
//       ),
//     );
//   }
// }
