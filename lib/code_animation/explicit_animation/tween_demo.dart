import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  const new({super.key});

  @override
  State<TweenDemo> createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnim;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    sizeAnim = Tween<double>(
      begin: 50,
      end: 200,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (controller.isAnimating) {
              controller.stop();
            } else {
              controller.repeat(reverse: true);
            }
          },
          child: AnimatedBuilder(
            animation: sizeAnim,
            builder: (context, child) {
              return Container(
                width: sizeAnim.value,
                height: sizeAnim.value,
                color: Colors.black,
                child: child,
              );
            },
            child: Text(
              'Tap to start / pause',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
