// import 'package:fiklu_app/models/vehicles.dart';
// import 'package:flutter/material.dart';
// import 'map_screen.dart';

// class ServiceDetailsScreen extends StatefulWidget {
//   ServiceDetailsScreen();
//   @override
//   _ServiceDetailsScreenState createState() => _ServiceDetailsScreenState();
// }

// class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
//   static VehicleService _vehicleService = VehicleService();

//   String vehicleType =
//       (_vehicleService.vehicleType == VehType.bike) ? 'Bike' : 'Car';
//   String serviceType;
//   String regNum = _vehicleService.vehicleRegNum;

//   @override
//   Widget build(BuildContext context) {
//     switch (_vehicleService.serviceType) {
//       case ServiceType.fullService:
//         serviceType = 'Full Service';
//         break;
//       case ServiceType.partService:
//         serviceType = 'Part Service';
//         break;
//       case ServiceType.washing:
//         serviceType = 'Washing';
//         break;
//       case ServiceType.emergencyService:
//         serviceType = 'Emergency Service';
//         break;
//       default:
//     }
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Image.asset('images/logo.png', width: 100),
//             Text(
//               'Details',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Column(
//               children: <Widget>[
//                 ListTile(
//                   title: Text(
//                     'Your details',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Name: ${_vehicleService.ownerName}',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   title: Text(
//                     'Vehicle details',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     '$vehicleType : ${_vehicleService.vehicleName}\nReg. No. : $regNum',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   title: Text(
//                     'Service details',
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     '$serviceType',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             MaterialButton(
//               elevation: 5.0,
//               color: Colors.white70,
//               child: Text('Proceed'),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => MapScreen()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
