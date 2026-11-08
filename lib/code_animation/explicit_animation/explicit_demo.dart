import 'package:flutter/material.dart';

class ExplicitDemo extends StatefulWidget {
  const new({super.key});

  @override
  State<ExplicitDemo> createState() => _ExplicitDemoState();
}

class _ExplicitDemoState extends State<ExplicitDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnim;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    colorAnim = ColorTween(
      begin: Colors.red,
      end: Colors.green,
    ).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: colorAnim.value ?? Colors.red,
              child: Center(
                child: Text(
                  'Value ${controller.value.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
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
}
