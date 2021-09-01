import 'dart:math' as math;

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
class BasicTweenAnimationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic tween animation'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/earth_background.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
            Center(
              child: TweenAnimationBuilder(
                duration: Duration(seconds: 5),
                child: Image.asset(
                  'assets/images/earth.png',
                  width: 100,
                  height: 100,
                ),
                tween: Tween<double>(begin: 0, end: 5 * math.pi),
                builder: (context, double angle, child) {
                  return Transform.rotate(
                    angle: angle,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
