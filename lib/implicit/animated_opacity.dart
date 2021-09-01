import 'package:flutter/material.dart';

/*
 * Animated version of Opacity which automatically transitions the child's
 * opacity over a given duration whenever the given opacity changes.
 */
class AnimatedOpacityWidget extends StatefulWidget {
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacityLevel = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _opacityLevel = _opacityLevel == 1 ? 0.05 : 1;
          });
        },
        child: SafeArea(
          child: Center(
            child: Container(
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _opacityLevel,
                child: FlutterLogo(size: 75),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
