import 'package:flutter/material.dart';

class RotationDemo extends StatefulWidget {
  const new({super.key});

  @override
  State<RotationDemo> createState() => _RotationDemoState();
}

class _RotationDemoState extends State<RotationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> turnsAnim;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    turnsAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RotationTransition(
              turns: turnsAnim,
              child: Image.asset('assets/images/cd.png'),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () => controller.repeat(),
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
}
