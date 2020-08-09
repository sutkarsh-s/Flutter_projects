// import 'package:flutter/material.dart';
// import 'veh_reg_success_screen.dart';
// import 'package:fiklu_app/models/vehicles.dart';

// class RegisterVehicleScreen extends StatefulWidget {
//   final String vehType;
//   RegisterVehicleScreen(this.vehType);
//   @override
//   _RegisterVehicleScreenState createState() => _RegisterVehicleScreenState();
// }

// class _RegisterVehicleScreenState extends State<RegisterVehicleScreen> {
//   VehicleService _vehicleService = VehicleService();

//   final GlobalKey<FormState> _userFormKey = GlobalKey<FormState>();

//   Widget _buildOwnerField() {
//     return TextFormField(
//       validator: (val) => val.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Owner Name',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         _vehicleService.ownerName = value.trim();
//       },
//     );
//   }

//   Widget _buildVehicleNameField() {
//     return TextFormField(
//       validator: (value) =>
//           value.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Vehicle Name',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         _vehicleService.vehicleName = value.trim();
//       },
//     );
//   }

//   Widget _buildRegNumField() {
//     return TextFormField(
//       validator: (value) =>
//           value.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Vehicle Registration Number',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         _vehicleService.vehicleRegNum = value.trim();
//       },
//     );
//   }

//   Widget _buildEngineNum() {
//     return TextFormField(
//       validator: (value) =>
//           value.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Engine Number',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         _vehicleService.engNum = value.trim();
//       },
//     );
//   }

//   Widget _buildSeriesField() {
//     return TextFormField(
//       validator: (value) =>
//           value.isEmpty ? 'This field can not be empty' : null,
//       decoration: InputDecoration(
//         hintText: 'Series',
//         contentPadding: EdgeInsets.symmetric(horizontal: 20),
//       ),
//       onSaved: (value) {
//         _vehicleService.series = value.trim();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.vehType == 'car') {
//       _vehicleService.vehicleType = VehType.car;
//     } else {
//       _vehicleService.vehicleType = VehType.bike;
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
//               'Register Your Vehicle',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Form(
//               key: _userFormKey,
//               child: Column(
//                 children: <Widget>[
//                   _buildOwnerField(),
//                   _buildVehicleNameField(),
//                   _buildRegNumField(),
//                   _buildSeriesField(),
//                   _buildEngineNum(),
//                   MaterialButton(
//                     elevation: 5.0,
//                     color: Colors.white70,
//                     child: Text('Register'),
//                     onPressed: () {
//                       if (!_userFormKey.currentState.validate()) {
//                         return;
//                       } else {
//                         _userFormKey.currentState.save();
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => VehRegSuccessScreen()));
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
