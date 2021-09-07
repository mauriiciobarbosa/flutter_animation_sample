import 'package:flutter/material.dart';

class NuInvestButton extends StatelessWidget {
  NuInvestButton({
    required this.text,
    this.onPressed,
    this.style = NuInvestButtonStyle.PRIMARY,
  });

  final String text;
  final VoidCallback? onPressed;
  final NuInvestButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2 - 24;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: _getPrimaryColor(style),
        onPrimary: _getOnPrimaryColor(style),
        minimumSize: Size(width, 48),
        textStyle: TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(
            color: _getOnPrimaryColor(style),
          ),
        ),
      ),
      child: Text(text),
    );
  }

  Color _getPrimaryColor(NuInvestButtonStyle style) {
    return style == NuInvestButtonStyle.PRIMARY
        ? Colors.white
        : Colors.transparent;
  }

  Color _getOnPrimaryColor(NuInvestButtonStyle style) {
    return style == NuInvestButtonStyle.PRIMARY ? Colors.purple : Colors.white;
  }
}

enum NuInvestButtonStyle { PRIMARY, SECONDARY }
