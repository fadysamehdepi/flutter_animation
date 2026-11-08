import 'package:flutter/material.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedPositionedDemo> createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {
  bool moved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(height: 400, width: 400, color: Colors.amber),
            AnimatedPositioned(
              top: moved ? 300 : 50,
              left: moved ? 200 : 50,
              duration: Duration(seconds: 1),
              child: GestureDetector(
                onTap: () => setState(() => moved = !moved),
                child: Container(width: 100, height: 100, color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
