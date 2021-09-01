import 'package:flutter/material.dart';

/*
 * Animates its own size and clips and aligns the child.
 */
class SizeTransitionWidget extends StatefulWidget {
  @override
  _SizeTransitionWidgetState createState() => _SizeTransitionWidgetState();
}

class _SizeTransitionWidgetState extends State<SizeTransitionWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3),
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
        title: Text('SizeTransition'),
      ),
      body: SafeArea(
        child: SizeTransition(
          sizeFactor: _animation,
          axis: Axis.horizontal,
          axisAlignment: -1, // animated with the children in the center
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: FlutterLogo(size: 200.0),
            ),
          ),
        ),
      ),
    );
  }
}
