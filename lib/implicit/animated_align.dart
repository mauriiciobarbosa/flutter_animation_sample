import 'package:flutter/material.dart';

/*
 * Animated version of Align which automatically transitions the
 * child's position over a given duration whenever the given alignment changes.
 */
class AnimatedAlignWidget extends StatefulWidget {
  @override
  _AnimatedAlignWidgetState createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedAlign'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: SafeArea(
          child: Center(
            child: Container(
              child: AnimatedAlign(
                alignment:
                    _selected ? Alignment.topRight : Alignment.bottomLeft,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: FlutterLogo(size: 50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
