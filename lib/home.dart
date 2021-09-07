import 'package:animation_sample/challenges/nu_invest_welcome_screen.dart';
import 'package:animation_sample/explicit/decorated_box_transition.dart';
import 'package:animation_sample/explicit/deep_dive_animation.dart';
import 'package:animation_sample/explicit/fade_transition.dart';
import 'package:animation_sample/implicit/animated_align.dart';
import 'package:animation_sample/implicit/animated_cross_fade.dart';
import 'package:animation_sample/implicit/animated_list_state.dart';
import 'package:animation_sample/implicit/animated_opacity.dart';
import 'package:animation_sample/implicit/animated_physical_model.dart';
import 'package:animation_sample/implicit/animated_positioned.dart';
import 'package:animation_sample/implicit/hero_transition.dart';
import 'package:flutter/material.dart';

import 'explicit/animated_builder.dart';
import 'explicit/positioned_transition.dart';
import 'explicit/rotation_transition.dart';
import 'explicit/scale_transition.dart';
import 'explicit/size_transition.dart';
import 'explicit/slide_transition.dart';
import 'implicit/animated_container.dart';
import 'implicit/animated_default_text_style.dart';
import 'implicit/animated_size.dart';
import 'implicit/basic_tween_animation.dart';
import 'implicit/complex_tween_animation.dart';

class Item {
  String name;
  Widget type;

  Item(this.name, this.type);
}

class Home extends StatelessWidget {
  final List<Item> items = [
    Item('AnimatedContainer', AnimatedContainerWidget()),
    Item('AnimatedAlign', AnimatedAlignWidget()),
    Item('AnimatedBuilder', AnimatedBuilderWidget()),
    Item('AnimatedCrossFade', AnimatedCrossFadeWidget()),
    Item('AnimatedDefaultTextStyle', AnimatedDefaultTextStyleWidget()),
    Item('AnimatedListState', AnimatedListStateWidget()),
    Item('AnimatedOpacity', AnimatedOpacityWidget()),
    Item('AnimatedPhysicalModel', AnimatedPhysicalModelWidget()),
    Item('AnimatedPositioned', AnimatedPositionedWidget()),
    Item('AnimatedSize', AnimatedSizeWidget()),
    Item('DecoratedBoxTransition', DecoratedBoxTransitionWidget()),
    Item('FadeTransition', FadeTransitionWidget()),
    Item('HeroTransition', HeroTransitionWidget()),
    Item('PositionedTransition', PositionedTransitionWidget()),
    Item('RotationTransition', RotationTransitionWidget()),
    Item('ScaleTransition', ScaleTransitionWidget()),
    Item('SizeTransition', SizeTransitionWidget()),
    Item('SlideTransition', SlideTransitionWidget()),
    Item('BasicTweenAnimation', BasicTweenAnimationWidget()),
    Item('ComplexTweenAnimation', ComplexTweenAnimationWidget()),
    Item('DeepDiveExplicitAnimation', DeepDiveExplicitAnimationWidget()),
    Item('Nu Invest Challenge', NuInvestWelcomeScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of animation'),
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
