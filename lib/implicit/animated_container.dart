import 'package:flutter/material.dart';

/*
 * A container that gradually changes its values over a period of time.
 */
class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool _biggerSize = false;
  bool _biggerPadding = false;
  bool _shouldScaleDown = false;

  @override
  Widget build(BuildContext context) {
    final width = 200.0;
    final height = 300.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.purple, Colors.transparent],
                  stops: [_biggerSize ? 0.2 : 0.5, 1.0],
                ),
              ),
              width: _biggerSize ? 250 : 100,
              padding: _biggerPadding ? EdgeInsets.all(36) : EdgeInsets.all(8),
              transform: (_shouldScaleDown
                  ? (Matrix4.identity()
                    ..rotateZ(360)
                    ..translate(0.025 * width, 0.025 * height)
                    ..scale(0.5, 0.5))
                  : Matrix4.identity()),
              duration: Duration(seconds: 1),
              child: FlutterLogo(size: _biggerSize ? 250 : 100),
              curve: Curves.easeInOutQuint,
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Change Size'),
                  onPressed: () {
                    setState(
                      () {
                        _biggerSize = !_biggerSize;
                      },
                    );
                  },
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  child: Text('Change Padding'),
                  onPressed: () {
                    setState(
                      () {
                        _biggerPadding = !_biggerPadding;
                      },
                    );
                  },
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  child: Text('Change scale && rotate'),
                  onPressed: () {
                    setState(
                      () {
                        _shouldScaleDown = !_shouldScaleDown;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
