import 'package:flutter/material.dart';

/*
 * A widget that cross-fades between two given children and animates
 * itself between their sizes.
 */
class AnimatedCrossFadeWidget extends StatefulWidget {
  @override
  _AnimatedCrossFadeWidgetState createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _first = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _first = !_first;
          });
        },
        child: SafeArea(
          child: Center(
            child: Container(
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 800),
                firstChild: FlutterLogo(
                  size: 100,
                  style: FlutterLogoStyle.horizontal,
                ),
                secondChild: FlutterLogo(
                  size: 100,
                  style: FlutterLogoStyle.stacked,
                ),
                sizeCurve: Curves.bounceIn,
                crossFadeState: _first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
