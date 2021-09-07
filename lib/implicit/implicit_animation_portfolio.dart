import 'package:animation_sample/model/item.dart';
import 'package:flutter/material.dart';

import 'animated_align.dart';
import 'animated_container.dart';
import 'animated_cross_fade.dart';
import 'animated_default_text_style.dart';
import 'animated_list_state.dart';
import 'animated_opacity.dart';
import 'animated_physical_model.dart';
import 'animated_positioned.dart';
import 'animated_size.dart';
import 'basic_tween_animation.dart';
import 'complex_tween_animation.dart';
import 'hero_transition.dart';

class ImplicitAnimationPortfolio extends StatelessWidget {
  final List<Item> items = [
    Item('AnimatedAlign', AnimatedAlignWidget()),
    Item('AnimatedContainer', AnimatedContainerWidget()),
    Item('AnimatedCrossFade', AnimatedCrossFadeWidget()),
    Item('AnimatedDefaultTextStyle', AnimatedDefaultTextStyleWidget()),
    Item('AnimatedListState', AnimatedListStateWidget()),
    Item('AnimatedOpacity', AnimatedOpacityWidget()),
    Item('AnimatedPhysicalModel', AnimatedPhysicalModelWidget()),
    Item('AnimatedPositioned', AnimatedPositionedWidget()),
    Item('AnimatedSize', AnimatedSizeWidget()),
    Item('BasicTweenAnimation', BasicTweenAnimationWidget()),
    Item('ComplexTweenAnimation', ComplexTweenAnimationWidget()),
    Item('Hero Transition', HeroTransitionWidget()),
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
