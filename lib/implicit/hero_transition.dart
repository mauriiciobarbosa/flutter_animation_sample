import 'package:flutter/material.dart';

/*
 * A widget that marks its child as being a candidate for hero animations.
 *
 * When a PageRoute is pushed or popped with the Navigator, the entire
 * screen's content is replaced. An old route disappears and a new route
 * appears. If there's a common visual feature on both routes then it can
 * be helpful for orienting the user for the feature to physically move from
 * one page to the other during the routes' transition. Such an animation
 * is called a hero animation. The hero widgets "fly" in the Navigator's
 * overlay during the transition and while they're in-flight they're, by
 * default, not shown in their original locations in the old and new routes.
 *
 * To label a widget as such a feature, wrap it in a Hero widget. When
 * navigation happens, the Hero widgets on each route are identified by the
 * HeroController. For each pair of Hero widgets that have the same tag,
 * a hero animation is triggered.
 *
 * If a Hero is already in flight when navigation occurs, its flight animation
 *  will be redirected to its new destination. The widget shown in-flight
 * during the transition is, by default, the destination route's Hero's child.
 *
 * For a Hero animation to trigger, the Hero has to exist on the very first
 * frame of the new page's animation.
 *
 * Routes must not contain more than one Hero for each tag.
 */
class HeroTransitionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroTransition - First page'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ListTile(
              leading: Hero(
                tag: 'hero-rectangle',
                child: _blueRectangle(Size(50, 50)),
              ),
              title: Text('Tap the icon to view hero animation transition.'),
              onTap: () => _goToDetailsPage(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _blueRectangle(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }

  void _goToDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('HeroTransition - Second page'),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'hero-rectangle',
                    child: _blueRectangle(Size(50, 50)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
