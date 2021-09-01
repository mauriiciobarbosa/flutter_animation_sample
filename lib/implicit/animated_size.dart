import 'package:flutter/material.dart';

/*
 * Animated widget that automatically transitions its size over a given
 * duration whenever the given child's size changes.
 */
class AnimatedSizeWidget extends StatefulWidget {
  @override
  _AnimatedSizeWidgetState createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget>
    with TickerProviderStateMixin {
  double _size = 100;

  void _updateSize() {
    setState(() {
      _size = _size == 100 ? 250 : 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSize'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() => _updateSize());
        },
        child: Center(
          child: Container(
            color: Colors.amberAccent,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: Duration(seconds: 1),
              vsync: this,
              child: FlutterLogo(size: _size),
            ),
          ),
        ),
      ),
    );
  }
}
