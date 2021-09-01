import 'dart:math' as math;

import 'package:flutter/material.dart';

/*
 * A general-purpose widget for building animations.
 *
 * AnimatedBuilder is useful for more complex widgets that wish to include
 * an animation as part of a larger build function. To use AnimatedBuilder,
 * simply construct the widget and pass it a builder function.
 */
class AnimatedBuilderWidget extends StatefulWidget {
  @override
  _AnimatedBuilderWidgetState createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilder'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: child,
            );
          },
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.green,
            child: FlutterLogo(size: 50),
          ),
        ),
      ),
    );
  }
}
