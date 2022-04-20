// import 'package:flutter/material.dart';
// import 'package:mynuu/components/navigate.dart';
// import 'package:mynuu/controllers/auth_controller.dart';
// import '../bottom_navigation_screens.dart';
// import 'package:get/get.dart';

// class AddNamePage extends StatelessWidget {
//   const AddNamePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController nameController = TextEditingController();
//     final _size = MediaQuery.of(context).size;
//     // AuthController authController = Get.put(AuthController());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Image.asset(
//                 'assets/logos/logo.png',
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Applicable taxes and 18% service\ncharge will be  added to your bill.',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(
//               height: _size.height * 0.08,
//             ),
//             SizedBox(
//               height: 100,
//               width: _size.width / 1.05,
//               child: TextFormField(
//                 controller: nameController,
//                 cursorColor: Colors.white,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w500, color: Colors.white),
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.white,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.white,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   labelText: 'Name',
//                   labelStyle: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                   ),
//                   // this will remove the default content padding
//                   // now you can customize it here or add padding widget
//                   contentPadding: const EdgeInsets.only(top: 0),
//                   prefixIcon: const Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   ),
//                 ),
//                 onChanged: (value) {
//                   //get value from text field here
//                 },
//               ),
//             ),
//             SizedBox(
//               height: _size.height * 0.03,
//             ),
//             GestureDetector(
//               onTap: () {
//                 push(context: context, widget: HomePageMain());
//                 // authController.saveFullNamee(nameController.text);
//               },
//               child: Container(
//                 height: 50,
//                 width: _size.width / 1.50,
//                 decoration: BoxDecoration(
//                   color: Colors.indigo,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Submit',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: _size.height * 0.07,
//             ),
//             const Center(
//               child: Text(
//                 'Follow us',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: _size.height * 0.03,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/icons/facebook.png',
//                   height: _size.height * 0.04,
//                 ),
//                 SizedBox(
//                   width: _size.width * 0.05,
//                 ),
//                 Image.asset(
//                   'assets/icons/instagram.png',
//                   height: _size.height * 0.04,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: _size.height * 0.09,
//             ),
//             const Center(
//               child: Text(
//                 'Powered by',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             Image.asset(
//               'assets/logos/logo2.png',
//               height: _size.height * 0.05,
//             ),
//             SizedBox(
//               height: _size.height * 0.01,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
