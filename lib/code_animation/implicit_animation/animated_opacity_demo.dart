import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IgnorePointer(
              ignoring: opacity == 0,
              child: InkWell(
                onTap: () => debugPrint('Tapped'),
                child: AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'I will fade',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => opacity = 0),
                  child: Text('Fade out'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => opacity = 1),
                  child: Text('Fade in'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
