import 'package:animation_sample/challenges/chat_screen.dart';
import 'package:animation_sample/model/item.dart';
import 'package:flutter/material.dart';

import 'nu_invest_welcome_screen.dart';

class ChallengeAnimationPortfolio extends StatelessWidget {
  final List<Item> items = [
    Item('Nu invest Welcome Screen', NuInvestWelcomeScreen()),
    Item('Chat Screen', ChatScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges'),
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
