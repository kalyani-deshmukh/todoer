import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration =  Duration(seconds: 3);
    return  Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =  AnimationController(
      vsync: this,
      duration:  Duration(seconds: 2),
    );
    animation =
     CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Container(
                  color: Colors.white,
                )
              )
            ],
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
               Image.asset(
                  'asset/images/todo.png',
                  // width: animation.value * 200,
                  // height: animation.value * 200,
                   width: 100,
                   height: 100,
              ),
              Spacer(),
              Image.asset(
                'asset/images/microsoft_logo.jpg',
                // width: animation.value * 150,
                // height: animation.value * 150,
                width: 140,
                height: 140,
              ),
            ],
          ),
        ],
      ),
    );
  }
}