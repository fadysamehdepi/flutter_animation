import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => clicked = !clicked),
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width: clicked ? 250 : 150,
            height: clicked ? 250 : 150,
            decoration: BoxDecoration(
              color: clicked ? Colors.blue : Colors.orange,
              borderRadius: BorderRadius.circular(clicked ? 30 : 10),
            ),
            child: Center(
              child: Text(
                'Animated Container',
                style: TextStyle(fontSize: clicked ? 25 : 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
