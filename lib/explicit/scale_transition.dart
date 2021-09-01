import 'package:flutter/material.dart';

/*
 * Animates the scale of transformed widget.
 */
class ScaleTransitionWidget extends StatefulWidget {
  @override
  _ScaleTransitionWidgetState createState() => _ScaleTransitionWidgetState();
}

class _ScaleTransitionWidgetState extends State<ScaleTransitionWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScaleTransition'),
      ),
      body: SafeArea(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FlutterLogo(size: 150.0),
            ),
          ),
        ),
      ),
    );
  }
}
