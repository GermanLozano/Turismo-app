// import 'package:flutter/material.dart';

// import '../../models/models.dart';
// import '../../widgets/widgets.dart';
// import 'animations/animations.dart';

// class MovieDetailScreen extends StatelessWidget {
//   const MovieDetailScreen({super.key, required this.movieModel});

//   final MovieModel movieModel;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       extendBodyBehindAppBar: true,
//       appBar: AppBarWidget(),
//       body: Stack(
//         children: [
//           Positioned(
//             top: size.height * -0.1,
//             height: size.height * 0.6,
//             width: size.width,
//             child: Hero(
//               tag: movieModel.id,
//               child: Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(movieModel.fulPosterimg),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(60),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey.shade300,
//                           offset: Offset(0, 28),
//                           blurRadius: 20,
//                           spreadRadius: 4),
//                     ]),
//               ),
//             ),
//           ),
//           Positioned(
//             top: size.height * 0.5,
//             width: size.width,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Hero(
//                     tag: movieModel.title,
//                     child: Material(
//                       type: MaterialType.transparency,
//                       child: Text(
//                         movieModel.title,
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                   OpacityTween(
//                     child: SlideUpTween(
//                       begin: Offset(0, 200),
//                       child: Text(
//                         movieModel.overview,
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w300),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: OpacityTween(
//         child: SlideUpTween(
//           begin: Offset(-30, 60),
//           child: BookButton(
//             title: 'Boy now',
//             onTap: () {
//               const transitionDuration = Duration(milliseconds: 300);
//               Navigator.of(context).push(
//                 PageRouteBuilder(
//                   transitionDuration: transitionDuration,
//                   reverseTransitionDuration: transitionDuration,
//                   pageBuilder: (_, animation, __) {
//                     return FadeTransition(
//                       opacity: animation,
//                       child: BookingPage(movieModel: movieModel),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

// class BookButton extends StatelessWidget {
//   const BookButton({super.key, required this.title, this.onTap});

//   final String title;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: const BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.all(
//             Radius.circular(28),
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//           child: Text(
//             title,
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BookingPage extends StatelessWidget {
//   const BookingPage({super.key, required this.movieModel});
//   final MovieModel movieModel;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       appBar: AppBarWidget(
//         color: Colors.black,
//         title: movieModel.title,
//       ),
//       body: Column(
//         spacing: 10,
//         children: [
//           SizedBox(
//             width: size.width,
//             height: size.height * 0.08,
//             child: ListView.separated(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               scrollDirection: Axis.horizontal,
//               physics: BouncingScrollPhysics(),
//               itemCount: 5,
//               separatorBuilder: (context, index) => SizedBox(
//                 width: 10,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 return MovieDateCard(isSelected: index == 0, day: index);
//               },
//             ),
//           ),
//           SizedBox(
//             width: size.width,
//             height: size.height * 0.2,
//             child: LayoutBuilder(builder: (context, constraints) {
//               final width = constraints.maxWidth;

//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Stack(
//                   // clipBehavior: Clip.none,
//                   children: [
//                     Positioned.fill(
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 10),
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               movieModel.fulPosterimg,
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         transform: Matrix4.identity()
//                           ..setEntry(3, 2, 0.001)
//                           ..rotateX(0.8),
//                         transformAlignment: Alignment.center,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       width: width,
//                       child: Divider(),
//                     )
//                   ],
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MovieDateCard extends StatelessWidget {
//   const MovieDateCard({
//     super.key,
//     required this.isSelected,
//     required this.day,
//   });

//   final int day;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.blue : Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(8)),
//         border: Border.all(color: Colors.blue),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             '$day OCT',
//             style: TextStyle(
//               color: isSelected ? Colors.white70 : Colors.blue,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             "0$day:00PM",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: isSelected ? Colors.white : Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
