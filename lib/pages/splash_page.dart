import 'dart:async';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class SplashPage extends StatefulWidget {
  final Curve curve;
  final int animationDuration;
  final int afterglowDuration;

  SplashPage({@required this.curve, @required this.animationDuration, @required this.afterglowDuration});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: widget.animationDuration),
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((duration) => _playAnimation());
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      // await _controller.reverse().orCancel;
      await Future.delayed(Duration(milliseconds: widget.afterglowDuration));
      Navigator.of(context).pop();
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Center(
          child: SplashAnimation(
            controller: _controller,
            curve: widget.curve,
          ),
        ),
      ),
    );
  }
}

class SplashAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> size;
  final Curve curve;

  SplashAnimation({
    Key key,
    @required this.controller,
    @required this.curve,
  }) : size = Tween<double>(
          begin: 0.0,
          end: 200.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: curve,
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Image(
      image: AssetImage('images/flutter.png'),
      width: size.value,
      height: size.value,
      fit: BoxFit.contain,
    );
  }
}
