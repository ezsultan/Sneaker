// import 'package:flutter/material.dart';
// import 'package:sneaker/theme/color.dart';

// class CustomBottomNavbar extends StatefulWidget {
//   final String icon;
//   final double index;
//   final int? currentIndex;

//   const CustomBottomNavbar({
//     Key? key,
//     required this.icon,
//     required this.index,
//     required this.currentIndex,
//   }) : super(key: key);

//   @override
//   State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
// }

// class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
//   // int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 10,
//         ),
//         SizedBox(
//           child: Image.asset(
//             widget.icon,
//             width: 20,
//             height: 24,
//             color:
//                 widget.currentIndex == widget.index ? primaryColor : textColor,
//           ),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         widget.currentIndex == widget.index
//             ? Container(
//                 width: 4,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: widget.currentIndex == widget.index
//                       ? primaryColor
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               )
//             : const SizedBox(
//                 height: 5,
//               ),
//       ],
//     );
//   }
// }
