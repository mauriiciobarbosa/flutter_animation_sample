import 'package:flutter/material.dart';

/*
 * Animated version of Positioned which automatically transitions the child's
 * position over a given duration whenever the given position changes.
 */
class AnimatedPositionedWidget extends StatefulWidget {
  @override
  _AnimatedPositionedWidgetState createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPositioned'),
      ),
      body: SafeArea(
        child: Stack(children: [
          AnimatedPositioned(
            width: _selected ? 200 : 500,
            height: _selected ? 50 : 200,
            top: _selected ? 50 : 150,
            duration: Duration(milliseconds: 800),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() => _selected = !_selected);
              },
              child: Container(
                color: Colors.blue,
                child: Center(child: Text('Tap me')),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
