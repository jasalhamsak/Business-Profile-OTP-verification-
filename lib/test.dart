// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class Test extends StatelessWidget {
//   const Test({super.key});
//
//
//
//   final bool isTrue =false;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: const Color(0xff47BA82), // Green border
//             width: 4,
//           ),
//         ),
//         child: ClipOval(
//         child: Image.network(
//     (isTrue)
//     ? "https://img.freepik.com/premium-vector/blue-silhouette-person-s-face-against-white-background_754208-70.jpg?w=2000"
//         : "https://img.freepik.com/premium-vector/blue-silhouette-person-s-face-against-white-background_754208-70.jpg?w=2000",
//     fit: BoxFit.cover,
//     loadingBuilder: (context, child, loadingProgress) {
//     if (loadingProgress == null) return child;
//     return Shimmer.fromColors(
//     baseColor: Color(0xFFE0E0E0),
//     highlightColor: Color(0xFFF5F5F5),
//     child: Container(
//     width: 120,
//     height: 120,
//     color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
