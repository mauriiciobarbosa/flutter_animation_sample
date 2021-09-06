import 'package:flutter/material.dart';

// From Scratch
class DeepDiveExplicitAnimationWidget extends StatefulWidget {
  @override
  _DeepDiveAnimationState createState() => _DeepDiveAnimationState();
}

class _DeepDiveAnimationState extends State<DeepDiveExplicitAnimationWidget>
    with SingleTickerProviderStateMixin<DeepDiveExplicitAnimationWidget> {
  late AnimationController _controller;
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.addListener(_update);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _update() {
    setState(() {
      _value = (_controller.value * 299792458).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeepDiveExplicitAnimation'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Value is $_value',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 36.0,
                ),
              ),
              // SizedBox(height: 16.0),
              // Text('Ticker'),
              // Text('    - Elapsed: ${}'),
              SizedBox(height: 16.0),
              Text('Controller'),
              Text(' - value: ${_controller.value}'),
              Text(
                  ' - percent: ${(_controller.value / _controller.duration!.inSeconds * 100).toInt()}%'),
              Text(' - status: ${_controller.status}'),
            ],
          ),
        ),
      ),
    );
  }
}

// Using TweenAnimation
// class DeepDiveExplicitAnimationWidget extends StatelessWidget {
//   const DeepDiveExplicitAnimationWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DeepDiveExplicitAnimation'),
//       ),
//       body: SafeArea(
//         child: TweenAnimationBuilder(
//           tween: IntTween(begin: 0, end: 299792458),
//           duration: Duration(seconds: 1),
//           builder: (context, value, child) {
//             return Center(
//               child: Text(
//                 'Value is $value',
//                 style: TextStyle(color: Colors.orange, fontSize: 36.0),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
