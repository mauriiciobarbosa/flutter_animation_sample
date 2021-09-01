import 'package:flutter/material.dart';

/*
 * Animated version of PhysicalModel.
 *
 * The borderRadius and elevation are animated.
 *
 * The color is animated if the animateColor property is set; otherwise,
 * the color changes immediately at the start of the animation for the other
 * two properties. This allows the color to be animated independently
 * (e.g. because it is being driven by an AnimatedTheme).
 *
 * The shape is not animated.
 */
class AnimatedPhysicalModelWidget extends StatefulWidget {
  @override
  _AnimatedPhysicalModelWidgetState createState() =>
      _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState
    extends State<AnimatedPhysicalModelWidget> {
  bool _play = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPhysicalModel'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _play = !_play;
          });
        },
        child: SafeArea(
          child: Center(
            child: AnimatedPhysicalModel(
              duration: Duration(seconds: 1),
              color: _play ? Colors.red : Colors.blue,
              elevation: _play ? 9 : 3,
              shape: _play ? BoxShape.circle : BoxShape.rectangle,
              shadowColor: _play ? Colors.deepOrange : Colors.deepPurple,
              borderRadius: BorderRadius.all(Radius.circular(_play ? 16 : 32)),
              child: Container(
                width: 240,
                height: 240,
                child: Center(
                  child: Text(
                    'AnimatedPhysicModel',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
