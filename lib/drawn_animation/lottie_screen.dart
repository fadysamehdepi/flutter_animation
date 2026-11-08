import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {
  bool animate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => setState(() {
            animate = !animate;
          }),
          child: LottieBuilder.asset(
            'assets/animations/loading.json',
            width: 400,
            height: 400,
            animate: animate,
          ),
        ),
      ),
    );
  }
}
