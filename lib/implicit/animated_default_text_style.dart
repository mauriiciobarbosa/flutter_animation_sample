import 'package:flutter/material.dart';

/*
 * Animated version of DefaultTextStyle which automatically transitions
 * the default text style (the text style to apply to descendant Text
 * widgets without explicit style) over a given duration whenever the
 * given style changes.
 *
 * The textAlign, softWrap, overflow, maxLines, textWidthBasis and
 * textHeightBehavior properties are not animated and take effect
 * immediately when changed.
 */
class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleWidgetState createState() =>
      _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState
    extends State<AnimatedDefaultTextStyleWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedDefaultTextStyle'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: SafeArea(
          child: Center(
            child: Container(
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                curve: Curves.bounceInOut,
                style: _isSelected
                    ? TextStyle(
                        fontSize: 50,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      )
                    : TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w100,
                      ),
                child: Text('Animate me'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
