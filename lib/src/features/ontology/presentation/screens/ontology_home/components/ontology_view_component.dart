// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../provider/provider.dart';
// import '../../movie_detail/movie_detail_screen.dart';

// class MovieViewComponent extends StatefulWidget {
//   const MovieViewComponent({
//     super.key,
//   });

//   @override
//   State<MovieViewComponent> createState() => _MovieViewComponentState();
// }

// class _MovieViewComponentState extends State<MovieViewComponent> {
//   late final PageController _movieCardPageContoller;
//   late final PageController _movieDetailPageContoller;

//   double _movieCardPage = 0;
//   double _movieDetailPage = 0;

//   @override
//   void initState() {
//     _movieCardPageContoller = PageController(viewportFraction: 0.77)
//       ..addListener(_movieCardPageListener);
//     _movieDetailPageContoller = PageController()
//       ..addListener(movieDetailPageListener);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final height = constraints.maxHeight;
//         final width = constraints.maxWidth;
//         final movies = context.watch<MoviesPrivider>().movies;
//         return Column(
//           children: [
//             Spacer(),
//             SizedBox(
//               height: height * 0.6,
//               child: PageView.builder(
//                 controller: _movieCardPageContoller,
//                 clipBehavior: Clip.none,
//                 itemCount: movies.length,
//                 onPageChanged: (page) {
//                   _movieDetailPageContoller.animateToPage(page,
//                       duration: Duration(milliseconds: 500),
//                       curve: Curves.decelerate);
//                 },
//                 itemBuilder: (context, index) {
//                   final movieModel = movies[index];
//                   final progress = (_movieCardPage - index);
//                   final scale = lerpDouble(1, 0.8, progress.abs())!;

//                   return Transform.scale(
//                     alignment: Alignment.lerp(
//                         Alignment.topLeft, Alignment.bottomCenter, -progress),
//                     scale: scale,
//                     child: GestureDetector(
//                       onTap: () {
//                         const transitionDuration = Duration(milliseconds: 300);

//                         Navigator.of(context).push(
//                           PageRouteBuilder(
//                             transitionDuration: transitionDuration,
//                             reverseTransitionDuration: transitionDuration,
//                             pageBuilder: (_, animation, __) {
//                               return FadeTransition(
//                                 opacity: animation,
//                                 child:
//                                     MovieDetailScreen(movieModel: movieModel),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       child: Hero(
//                         tag: movieModel.id,
//                         child: AnimatedContainer(
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.easeInOut,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(movieModel.fulPosterimg!),
//                               fit: BoxFit.cover,
//                             ),
//                             borderRadius: BorderRadius.circular(60),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.shade300,
//                                   offset: Offset(0, 28),
//                                   blurRadius: 20,
//                                   spreadRadius: 4),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Spacer(),
//             SizedBox(
//               height: height * 0.25,
//               child: PageView.builder(
//                 controller: _movieDetailPageContoller,
//                 clipBehavior: Clip.none,
//                 itemCount: movies.length,
//                 onPageChanged: (page) {
//                   _movieCardPageContoller.animateToPage(page,
//                       duration: Duration(milliseconds: 500),
//                       curve: Curves.decelerate);
//                 },
//                 itemBuilder: (context, index) {
//                   final movie = movies[index];
//                   final opcacity = (index - _movieDetailPage).clamp(0.0, 1.0);
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: width * 0.1),
//                     child: Opacity(
//                         opacity: 1 - opcacity,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Hero(
//                               tag: movie.title,
//                               child: Material(
//                                 type: MaterialType.transparency,
//                                 child: Text(
//                                   movie.title,
//                                   style: TextStyle(
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               movie.overview,
//                               maxLines: 3,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w300),
//                             ),
//                           ],
//                         )),
//                   );
//                 },
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }

//   void _movieCardPageListener() {
//     setState(() {
//       _movieCardPage = _movieCardPageContoller.page!;
//     });
//   }

//   void movieDetailPageListener() {
//     _movieDetailPage = _movieDetailPageContoller.page!;
//   }
// }
