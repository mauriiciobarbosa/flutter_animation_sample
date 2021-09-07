import 'package:animation_sample/components/nu_invest_button.dart';
import 'package:flutter/material.dart';

class NuInvestWelcomeScreen extends StatelessWidget {
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
            child: Image.asset(
              'assets/images/nu_invest_logo.png',
              alignment: Alignment.bottomLeft,
            ),
          ),
          Positioned(
            bottom: 160,
            left: 16,
            right: 16,
            child: Text(
              'Easynvest agora é Nu invest',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 16,
            right: 16,
            child: Text(
              'Faça parte da revolução roxa',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
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
          )
        ],
      ),
    );
  }
}
