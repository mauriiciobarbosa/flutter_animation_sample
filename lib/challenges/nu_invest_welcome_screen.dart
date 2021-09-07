import 'package:animation_sample/components/nu_invest_button.dart';
import 'package:flutter/material.dart';

/*
 * First try
 */
class NuInvestWelcomeScreen extends StatefulWidget {
  @override
  _NuInvestWelcomeScreenState createState() => _NuInvestWelcomeScreenState();
}

class _NuInvestWelcomeScreenState extends State<NuInvestWelcomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
  )..forward();
  late final Animation<Offset> _animationLogo = Tween<Offset>(
    begin: Offset(0, -1.5),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));
  late final Animation<Offset> _animationWords = Tween<Offset>(
    begin: Offset(-1.5, 0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInQuart,
  ));
  late final Animation<Offset> _animationButtons = Tween<Offset>(
    begin: Offset(0, 1.8),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome_screen_background.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: 32,
            left: 16,
            right: 16,
            child: SlideTransition(
              position: _animationLogo,
              child: Image.asset(
                'assets/images/nu_invest_logo.png',
                alignment: Alignment.bottomLeft,
              ),
            ),
          ),
          Positioned(
            bottom: 160,
            left: 16,
            right: 16,
            child: SlideTransition(
              position: _animationWords,
              child: Text(
                'Easynvest agora é Nu invest',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 16,
            right: 16,
            child: SlideTransition(
              position: _animationWords,
              child: Text(
                'Faça parte da revolução roxa',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: SlideTransition(
              position: _animationButtons,
              child: Row(
                children: [
                  NuInvestButton(
                    text: 'Abrir conta',
                    style: NuInvestButtonStyle.SECONDARY,
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 16),
                  NuInvestButton(
                    text: 'Entrar',
                    style: NuInvestButtonStyle.PRIMARY,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
