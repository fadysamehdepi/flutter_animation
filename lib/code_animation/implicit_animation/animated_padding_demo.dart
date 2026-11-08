import 'package:flutter/material.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedPaddingDemo> createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: AnimatedPadding(
            padding: EdgeInsets.all(expanded ? 50 : 10),
            duration: Duration(seconds: 1),
            child: Container(color: Colors.orange, width: 100, height: 100),
          ),
        ),
      ),
    );
  }
}
