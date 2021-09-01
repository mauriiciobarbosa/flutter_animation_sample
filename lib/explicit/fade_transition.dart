import 'package:flutter/material.dart';

/*
 * Animates the opacity of a widget.
 *
 * For a widget that automatically animates between the sizes of two children,
 * fading between them, see AnimatedCrossFade.
 */
class FadeTransitionWidget extends StatefulWidget {
  @override
  _FadeTransitionWidgetState createState() => _FadeTransitionWidgetState();
}

class _FadeTransitionWidgetState extends State<FadeTransitionWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
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
        title: Text('FadeTransition'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: FadeTransition(
            opacity: _animation,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FlutterLogo(),
            ),
          ),
        ),
      ),
    );
  }
}
