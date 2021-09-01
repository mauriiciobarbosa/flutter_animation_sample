import 'package:flutter/material.dart';

/*
 * Animates the rotation of a widget.
 */
class RotationTransitionWidget extends StatefulWidget {
  @override
  _RotationTransitionWidgetState createState() =>
      _RotationTransitionWidgetState();
}

class _RotationTransitionWidgetState extends State<RotationTransitionWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticInOut,
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
        title: Text('RotationTransition'),
      ),
      body: SafeArea(
        child: Center(
          child: RotationTransition(
            turns: _animation,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FlutterLogo(size: 150),
            ),
          ),
        ),
      ),
    );
  }
}
