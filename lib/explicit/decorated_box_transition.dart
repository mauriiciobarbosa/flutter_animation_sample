import 'package:flutter/material.dart';

/*
 * Animated version of a DecoratedBox that animates the different
 * properties of its Decoration.
 */
class DecoratedBoxTransitionWidget extends StatefulWidget {
  @override
  _DecoratedBoxTransitionWidgetState createState() =>
      _DecoratedBoxTransitionWidgetState();
}

class _DecoratedBoxTransitionWidgetState
    extends State<DecoratedBoxTransitionWidget> with TickerProviderStateMixin {
  final decorationTween = DecorationTween(
    begin: BoxDecoration(
        color: Colors.white,
        border: Border.all(style: BorderStyle.none),
        borderRadius: BorderRadius.circular(60),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 6))
        ]),
    end: BoxDecoration(
      color: Colors.black,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.zero,
    ),
  );
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DecoratedBoxTransition'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: DecoratedBoxTransition(
              position: DecorationPosition.background,
              decoration: decorationTween.animate(_controller),
              child: Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(16),
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
