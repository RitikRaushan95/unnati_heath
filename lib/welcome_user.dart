// import 'package:flutter/material.dart';

// void main() => runApp(WelcomeUser());

// class WelcomeUser extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(67, 177, 75, 1.0),
//         title: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () {
//                 // Add  navigation logic here
//               },
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Welcome',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Aastha',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             const CircleAvatar(
//               backgroundImage: AssetImage('assets/profile_image.png'),
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.notifications,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 // Add  notification logic here
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: const Color.fromARGB(255, 226, 244, 252),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 color: const Color.fromRGBO(67, 177, 75, 1.0),
//                 padding: const EdgeInsets.only(
//                   right: 18.0,
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Icon(Icons.location_on, color: Colors.white),
//                     SizedBox(width: 3),
//                     Text(
//                       'Patna, Bihar',
//                       style: TextStyle(fontSize: 15, color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(8),
//                 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Health Tracker',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.left,
//                         ),
//                         const SizedBox(height: 8),
//                         _buildInfoBox('89bpm', Icons.favorite),
//                         const SizedBox(height: 4),
//                         _buildInfoBox('7:43 hrs', Icons.brightness_2),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.only(right: 18),
//                           child: Text(
//                             'Walk',
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                         const Text(
//                           '1000/1500',
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold),
//                         ),
//                         _buildCircularProgressBar(0.66),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'Facilities',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Add  logic for "Show All" here
//                       },
//                       child: const Text(
//                         'Show All',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildBox('assets/doctor.png', 'Doctor'),
//                   _buildBox('assets/ambulance.png', 'Emergency'),
//                   _buildBox('assets/hospital.png', 'Hospital'),
//                   _buildBox('assets/cart.png', 'Stores'),
//                 ],
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   "Today's Checklist",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16),
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildChecklistItem('Paracetamol', '8:00 pm', true),
//                     _buildChecklistItem('Digene tablets', '10:00 pm', false),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   "Appointments",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 margin: const EdgeInsets.symmetric(horizontal: 16),
//                 height: 88,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         image: const DecorationImage(
//                           image: AssetImage('assets/profile_image2.png'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     const Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Dr. Karan Sharma",
//                             style: TextStyle(
//                               color: Color.fromRGBO(76, 175, 80, 1),
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             "Dentist",
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 10,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.calendar_today,
//                                 size: 20,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 "Wednesday, 3rd Jan",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.black),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.access_time,
//                                 size: 20,
//                                 color: Colors.black,
//                               ),
//                               SizedBox(width: 8),
//                               Text(
//                                 "7:00 PM",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.black),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.green,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.local_hospital),
//             label: 'Doctor',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_circle_outline),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             label: 'Ask',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Shop',
//           ),
//         ],
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.white,
//       ),
//     );
//   }

//   Widget _buildInfoBox(String text, IconData icon) {
//     return Container(
//       width: 160,
//       padding: const EdgeInsets.all(8),
//       margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.black),
//       ),
//       child: Row(
//         children: [
//           ClipOval(
//             child: Container(
//               height: 28,
//               color: Colors.green,
//               padding: const EdgeInsets.all(8),
//               child: icon == Icons.brightness_2
//                   ? Transform.rotate(
//                       angle: 2.3,
//                       child: Icon(
//                         icon,
//                         size: 16,
//                         color: Colors.white,
//                       ),
//                     )
//                   : Icon(
//                       icon,
//                       size: 16,
//                       color: Colors.white,
//                     ),
//             ),
//           ),
//           const SizedBox(width: 35),
//           Text(text),
//         ],
//       ),
//     );
//   }

//   Widget _buildCircularProgressBar(double percentage) {
//     return Container(
//       width: 70,
//       height: 70,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: Colors.transparent,
//                 width: 10,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 60,
//             height: 60,
//             child: CircularProgressIndicator(
//               value: percentage,
//               strokeWidth: 10,
//               valueColor: const AlwaysStoppedAnimation<Color>(
//                   Color.fromRGBO(67, 177, 75, 1.0)),
//               backgroundColor: Colors.black,
//             ),
//           ),
//           Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: Colors.transparent,
//                 width: 10,
//               ),
//             ),
//             alignment: Alignment.center,
//             child: Text(
//               '${(percentage * 100).toInt()}%',
//               style: const TextStyle(color: Color.fromRGBO(67, 177, 75, 1.0)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBox(String imagePath, String text) {
//     return Container(
//       width: 70,
//       height: 70,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: Colors.white,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             imagePath,
//             width: 40,
//             height: 40,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             text,
//             style: const TextStyle(fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildChecklistItem(String itemName, String time, bool isChecked) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             itemName,
//             style: const TextStyle(fontSize: 16),
//           ),
//           const SizedBox(width: 10),
//           Text(
//             time,
//             style: const TextStyle(fontSize: 16),
//           ),
//           Container(
//             width: 24,
//             height: 24,
//             decoration: BoxDecoration(
//               color: isChecked ? Colors.green : Colors.white,
//               border: Border.all(
//                 color: Colors.green,
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: isChecked
//                 ? const Icon(
//                     Icons.check,
//                     size: 18,
//                     color: Colors.white,
//                   )
//                 : null,
//           ),
//         ],
//       ),
//     );
//   }
// }
