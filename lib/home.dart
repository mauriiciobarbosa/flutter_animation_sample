import 'package:animation_sample/challenges/challenge_animation_portfolio.dart';
import 'package:animation_sample/explicit/explicit_animation_portfolio.dart';
import 'package:flutter/material.dart';

import 'implicit/implicit_animation_portfolio.dart';
import 'model/item.dart';

class Home extends StatelessWidget {
  final List<Item> items = [
    Item('Implicit Animations', ImplicitAnimationPortfolio()),
    Item('Explicit Animations', ExplicitAnimationPortfolio()),
    Item('Challenges', ChallengeAnimationPortfolio()),
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
