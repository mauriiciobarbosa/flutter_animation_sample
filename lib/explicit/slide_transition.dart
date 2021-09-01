import 'package:flutter/material.dart';

/*
 * Animates the position of a widget relative to its normal position.
 */
class SlideTransitionWidget extends StatefulWidget {
  @override
  _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<SlideTransitionWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(1.5, 0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SlideTransition'),
      ),
      body: SafeArea(
        child: SlideTransition(
          position: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: FlutterLogo(size: 150),
            ),
          ),
        ),
      ),
    );
  }
}
