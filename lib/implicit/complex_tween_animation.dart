import 'package:flutter/material.dart';

/*
 * TweenAnimationBuilder is a great way to create “set-it-and-forget-it”
 * implicit animations if you can’t find a built-in AnimatedFoo type widget.
 * You can accomplish simple animations using TweenAnimationBuilder without
 * needing to use a StatefulWidget.
 *
 * You can change that end value in the Tween to smoothly animate to a new value.
 * There are also potential performance optimizations by passing in a child
 * ahead of time or setting a static final Tween when appropriate.
 */
class ComplexTweenAnimationWidget extends StatefulWidget {
  @override
  _ComplexTweenAnimationWidgetState createState() =>
      _ComplexTweenAnimationWidgetState();
}

class _ComplexTweenAnimationWidgetState
    extends State<ComplexTweenAnimationWidget> {
  double _newValue = .4;
  Color _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex tween animation'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/earth_background.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Center(
                  child: TweenAnimationBuilder(
                    duration: Duration(seconds: 2),
                    tween: ColorTween(begin: Colors.white, end: _newColor),
                    // onEnd: () {
                    //   setState(() {
                    //     _newColor =
                    //         _newColor == Colors.red ? Colors.white : Colors.red;
                    //   });
                    // },
                    child: Image.asset(
                      'assets/images/sun.png',
                      width: 300,
                      height: 300,
                    ),
                    builder: (_, Color? color, Widget? child) {
                      return ColorFiltered(
                        child: child,
                        colorFilter: ColorFilter.mode(
                          color!,
                          BlendMode.modulate,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Slider.adaptive(
              value: _newValue,
              onChanged: (double value) {
                setState(() {
                  _newValue = value;
                  _newColor = Color.lerp(Colors.white, Colors.red, value)!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
