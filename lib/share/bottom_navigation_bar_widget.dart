// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'badge_widget.dart';
//
// class BottomNavigationBarWidget extends StatelessWidget {
//   final int indexSelected;
//   const BottomNavigationBarWidget(this.indexSelected, {Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     bool isUSerNotConnected = true;
//
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       currentIndex: indexSelected,
//       items: <BottomNavigationBarItem>[
//         const BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//           label: 'Accueil'
//         ),
//         const BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Recherche'
//         ),
//         BottomNavigationBarItem(
//           icon: isUSerNotConnected
//               ? const Icon(Icons.shopping_cart_outlined),
//               : BadgeWidget(
//                   value:0,
//                   top:0,
//                   right: 0,
//                   child: const Icon(Icons.shopping_cart)
//               ),
//           label: 'locations'
//           ),
//         BottomNavigationBarItem(
//         icon: Icon(Icons.search),
//         label: 'Profil'
//         ),
//       ]
//     );
//   }
// }
