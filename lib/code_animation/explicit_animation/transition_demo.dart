import 'package:flutter/material.dart';

class TransitionDemo extends StatefulWidget {
  const new({super.key});

  @override
  State<TransitionDemo> createState() => _TransitionDemoState();
}

class _TransitionDemoState extends State<TransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> curveAnim;
  late Animation<Offset> slideAnim;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    curveAnim = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    slideAnim = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(curveAnim);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(opacity: curveAnim, child: buildBox('Fade')),
            SlideTransition(position: slideAnim, child: buildBox('Slide')),
            ScaleTransition(scale: curveAnim, child: buildBox('Scale')),
            SizeTransition(
              sizeFactor: curveAnim,
              axis: Axis.horizontal,
              child: buildBox('Size'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () => controller.forward(),
                  child: Text('Play'),
                ),
                ElevatedButton(
                  onPressed: () => controller.stop(),
                  child: Text('Stop'),
                ),
                ElevatedButton(
                  onPressed: () => controller.repeat(reverse: true),
                  child: Text('Reverse'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBox(String text) => Container(
    width: 200,
    height: 50,
    color: Colors.teal,
    child: Center(
      child: Text(text, style: TextStyle(color: Colors.white)),
    ),
  );
}
