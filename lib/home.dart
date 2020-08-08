// import 'package:flutter/material.dart';
// import 'package:info_napza/presentation/screens/buku_napza/buku_napza.dart';
// import 'package:info_napza/widget/bottom_navbar.dart';
// import 'package:info_napza/details_screen.dart';
// import 'package:info_napza/home_page.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();

// }

// class _HomeScreenState extends State<HomeScreen> {

//   int _index = 1;
//   final List<Widget> _children = [
//     DetailsScreen(),
//     MyHomePageScreen(),
//     BookViewScreen()
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context)
//         .size;
//     return Scaffold(
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//         height: 80,
//         color: Colors.white,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             BottomNavItem(
//               title: "Jenis",
//               svgScr: "assets/icons/calendar.svg",
//               press: () {
//                 setState(() {
//                   _index = 0;
//                 });
//               },
//               isActive: _index == 0 ,
//             ),
//             BottomNavItem(
//               title: "Home",
//               svgScr: "assets/icons/calendar.svg",
//               press: () {
//                 setState(() {
//                   _index = 1;
//                 });
//               },
//               isActive: _index==1,
//             ),
//             BottomNavItem(
//               title: "Kuis",
//               svgScr: "assets/icons/Settings.svg",
//               press: () {
//                 setState(() {
//                   _index = 2;
//                 });
//               },
//               isActive: _index == 2,
//             ),
//           ],
//         ),
//       ),
//     body: _children[_index],
//     );
//   }

// }