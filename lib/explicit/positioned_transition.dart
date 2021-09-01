import 'package:flutter/material.dart';

/*
 * Animated version of Positioned which takes a specific
 * Animation<RelativeRect> to transition the child's position from a start
 * position to an end position over the lifetime of the animation.
 *
 * Only works if it's the child of a Stack.
 */
class PositionedTransitionWidget extends StatefulWidget {
  @override
  _PositionedTransitionWidgetState createState() =>
      _PositionedTransitionWidgetState();
}

class _PositionedTransitionWidgetState extends State<PositionedTransitionWidget>
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
    final smallLogo = 100.0;
    final bigLogo = 200.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('PositionedTransition'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final Size biggest = constraints.biggest;
            return Stack(
              children: [
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromSize(
                      Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                      biggest,
                    ),
                    end: RelativeRect.fromSize(
                        Rect.fromLTWH(
                          biggest.width - bigLogo,
                          biggest.height - bigLogo,
                          bigLogo,
                          bigLogo,
                        ),
                        biggest),
                  ).animate(_animation),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterLogo(),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
