import 'package:flutter/material.dart';
import '../utils/custom_page_route.dart';

import './splash_page.dart';

final double min = 0;
final double max = 2000;

final List<DropdownMenuItem<Curve>> _curves = [
  DropdownMenuItem(value: Curves.bounceIn, child: Text('bounceIn')),
  DropdownMenuItem(value: Curves.bounceInOut, child: Text('bounceInOut')),
  DropdownMenuItem(value: Curves.bounceOut, child: Text('bounceOut')),
  DropdownMenuItem(value: Curves.decelerate, child: Text('decelerate')),
  DropdownMenuItem(value: Curves.ease, child: Text('ease')),
  DropdownMenuItem(value: Curves.easeIn, child: Text('easeIn')),
  DropdownMenuItem(value: Curves.easeInBack, child: Text('easeInBack')),
  DropdownMenuItem(value: Curves.easeInCirc, child: Text('easeInCirc')),
  DropdownMenuItem(value: Curves.easeInCubic, child: Text('easeInCubic')),
  DropdownMenuItem(value: Curves.easeInExpo, child: Text('easeInExpo')),
  DropdownMenuItem(value: Curves.easeInOut, child: Text('easeInOut')),
  DropdownMenuItem(value: Curves.easeInOutBack, child: Text('easeInOutBack')),
  DropdownMenuItem(value: Curves.easeInOutCirc, child: Text('easeInOutCirc')),
  DropdownMenuItem(value: Curves.easeInOutCubic, child: Text('easeInOutCubic')),
  DropdownMenuItem(value: Curves.easeInOutExpo, child: Text('easeInOutExpo')),
  DropdownMenuItem(value: Curves.easeInOutQuad, child: Text('easeInOutQuad')),
  DropdownMenuItem(value: Curves.easeInOutQuart, child: Text('easeInOutQuart')),
  DropdownMenuItem(value: Curves.easeInOutQuint, child: Text('easeInOutQuint')),
  DropdownMenuItem(value: Curves.easeInOutSine, child: Text('easeInOutSine')),
  DropdownMenuItem(value: Curves.easeInQuad, child: Text('easeInQuad')),
  DropdownMenuItem(value: Curves.easeInQuart, child: Text('easeInQuart')),
  DropdownMenuItem(value: Curves.easeInQuint, child: Text('easeInQuint')),
  DropdownMenuItem(value: Curves.easeInSine, child: Text('easeInSine')),
  DropdownMenuItem(value: Curves.easeInToLinear, child: Text('easeInToLinear')),
  DropdownMenuItem(value: Curves.easeOut, child: Text('easeOut')),
  DropdownMenuItem(value: Curves.easeOutBack, child: Text('easeOutBack')),
  DropdownMenuItem(value: Curves.easeOutCirc, child: Text('easeOutCirc')),
  DropdownMenuItem(value: Curves.easeOutCubic, child: Text('easeOutCubic')),
  DropdownMenuItem(value: Curves.easeOutExpo, child: Text('easeOutExpo')),
  DropdownMenuItem(value: Curves.easeOutQuad, child: Text('easeOutQuad')),
  DropdownMenuItem(value: Curves.easeOutQuart, child: Text('easeOutQuart')),
  DropdownMenuItem(value: Curves.easeOutQuint, child: Text('easeOutQuint')),
  DropdownMenuItem(value: Curves.easeOutSine, child: Text('easeOutSine')),
  DropdownMenuItem(value: Curves.elasticIn, child: Text('elasticIn')),
  DropdownMenuItem(value: Curves.elasticInOut, child: Text('elasticInOut')),
  DropdownMenuItem(value: Curves.elasticOut, child: Text('elasticOut')),
  DropdownMenuItem(value: Curves.fastLinearToSlowEaseIn, child: Text('fastLinearToSlowEaseIn')),
  DropdownMenuItem(value: Curves.fastOutSlowIn, child: Text('fastOutSlowIn')),
  DropdownMenuItem(value: Curves.linear, child: Text('linear')),
  DropdownMenuItem(value: Curves.linearToEaseOut, child: Text('linearToEaseOut')),
  DropdownMenuItem(value: Curves.slowMiddle, child: Text('slowMiddle')),
];

class ParameterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParemeterState();
  }
}

class _ParemeterState extends State<ParameterPage> {
  Curve _curve;
  double _animationDuration = 1000;
  double _afterglowDuration = 1000;

  bool get _isValid {
    if (_curve != null && _animationDuration != null && _afterglowDuration != null) return true;
    return false;
  }

  void _launchOnPressed() {
    Navigator.of(context).push(
      // MaterialPageRoute(
      NoTransitionPageRoute(
        builder: (context) => SplashPage(
          curve: _curve,
          animationDuration: _animationDuration.floor(),
          afterglowDuration: _afterglowDuration.floor(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  Text('Animation Curve'),
                  SizedBox(height: 15),
                  Center(
                    child: DropdownButton(
                      items: _curves,
                      value: _curve,
                      hint: Text('Select Curve'),
                      onChanged: (curve) => setState(() => _curve = curve),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('Animation Duration'),
                  SizedBox(height: 15),
                  Center(child: SelectableText('${_animationDuration.floor()} ms')),
                  SizedBox(height: 15),
                  Slider(
                    value: _animationDuration,
                    min: min,
                    max: max,
                    divisions: (max - min).floor(),
                    label: _animationDuration.floor().toString(),
                    activeColor: Color(0xFF009688),
                    inactiveColor: Color(0x42000000),
                    onChanged: (duration) => setState(() => _animationDuration = duration),
                  ),
                  SizedBox(height: 30),
                  Text('Afterglow Duration'),
                  SizedBox(height: 15),
                  Center(child: SelectableText('${_afterglowDuration.floor()} ms')),
                  SizedBox(height: 15),
                  Slider(
                    value: _afterglowDuration,
                    min: min,
                    max: max,
                    divisions: (max - min).floor(),
                    label: _afterglowDuration.floor().toString(),
                    activeColor: Color(0xFF009688),
                    inactiveColor: Color(0x42000000),
                    onChanged: (duration) => setState(() => _afterglowDuration = duration),
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: RaisedButton(
                      onPressed: _isValid ? _launchOnPressed : null,
                      child: Text('LAUNCH', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
