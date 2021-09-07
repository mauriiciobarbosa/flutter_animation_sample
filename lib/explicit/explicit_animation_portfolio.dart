import 'package:animation_sample/model/item.dart';
import 'package:flutter/material.dart';

import 'animated_builder.dart';
import 'decorated_box_transition.dart';
import 'deep_dive_animation.dart';
import 'fade_transition.dart';
import 'positioned_transition.dart';
import 'rotation_transition.dart';
import 'scale_transition.dart';
import 'size_transition.dart';
import 'slide_transition.dart';

class ExplicitAnimationPortfolio extends StatelessWidget {
  final List<Item> items = [
    Item('AnimatedBuilder', AnimatedBuilderWidget()),
    Item('DecoratedBoxTransition', DecoratedBoxTransitionWidget()),
    Item('FadeTransition', FadeTransitionWidget()),
    Item('PositionedTransition', PositionedTransitionWidget()),
    Item('RotationTransition', RotationTransitionWidget()),
    Item('ScaleTransition', ScaleTransitionWidget()),
    Item('SizeTransition', SizeTransitionWidget()),
    Item('SlideTransition', SlideTransitionWidget()),
    Item('DeepDiveExplicitAnimation', DeepDiveExplicitAnimationWidget()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit animations'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, position) {
          return TextButton(
            onPressed: () => _open(context, items[position].type),
            child: Text(items[position].name),
          );
        },
      ),
    );
  }

  void _open(BuildContext context, Widget animatedWidget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => animatedWidget),
    );
  }
}
