// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spotlas_test/application/feed/feed_bloc.dart';
// import 'package:spotlas_test/infrastructure/feed/dtos/recommendation.dart';
// import 'package:spotlas_test/presentation/misc/svg_icons.dart';

// class AnimatedHeartWidget extends StatefulWidget {
//   final Recommendation recommendation;

//   const AnimatedHeartWidget(
//     this.recommendation, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<AnimatedHeartWidget> createState() => _AnimatedHeartWidgetState();
// }

// class _AnimatedHeartWidgetState extends State<AnimatedHeartWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _sizeAnimation;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 750),
//     );

//     _sizeAnimation = TweenSequence<double>([
//       TweenSequenceItem(
//         tween: Tween(begin: 0, end: 180),
//         weight: 1,
//       ),
//       TweenSequenceItem(
//         tween: Tween(begin: 180, end: 0),
//         weight: 1,
//       ),
//     ]).animate(CurvedAnimation(
//         parent: _animationController,
//         curve: const Interval(
//           0,
//           1,
//           curve: Curves.easeOut,
//         )));

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<FeedBloc, FeedState>(
//       listenWhen: (p, c) => shouldListen(p, c),
//       listener: (context, state) {
//         _animationController.reset();
//         _animationController.forward();
//       },
//       child: Align(
//         alignment: Alignment.center,
//         child: AnimatedBuilder(
//             animation: _animationController,
//             builder: (context, _) {
//               return ShaderMask(
//                 shaderCallback: (Rect bounds) {
//                   const gradient = [
//                     Color(0xFFFF0080),
//                     Color(0xFFFF0040),
//                   ];

//                   return const LinearGradient(
//                     colors: gradient,
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ).createShader(bounds);
//                 },
//                 child: SvgIcons.heart(
//                   width: _sizeAnimation.value,
//                   height: _sizeAnimation.value,
//                   color: Colors.white,
//                 ),
//               );
//             }),
//       ),
//     );
//   }

// }
