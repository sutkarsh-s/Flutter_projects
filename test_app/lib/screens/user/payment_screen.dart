// import 'package:fiklu_app/models/vehicles.dart';
// import 'package:flutter/material.dart';
// import 'payment_done_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class PaymentScreen extends StatefulWidget {
//   final String docId;
//   PaymentScreen({this.docId});
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   String centerName;

//   @override
//   void initState() {
//     super.initState();
//     getServiceDetails(widget.docId);
//   }

//   Future<String> getServiceDetails(String docId) async {
//     final _firestore = Firestore.instance;
//     await _firestore
//         .collection('service_centers')
//         .document(docId)
//         .get()
//         .then((center) => setState(() {
//               centerName = center.data['name'];
//             }));
//     return centerName;
//   }

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
//               'Payment',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Your details',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 'Name: ${_vehicleService.ownerName}',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Vehicle details',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 '$vehicleType : ${_vehicleService.vehicleName}\nReg. No. : $regNum',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Service details',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 '$serviceType',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Service Center',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 '$centerName,\ndistance = 105m',
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               'Cost Estimation: 2000 Rs.',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             MaterialButton(
//               elevation: 5.0,
//               color: Colors.white70,
//               child: Text('Proceed'),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => PaymentDoneScreen()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
