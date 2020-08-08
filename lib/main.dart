import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final Tween<double> dondurTween = Tween<double>(
    begin: 2, // 5-2 = 3 defa döndürülecek.
    end: 5,
  );

  AnimationController controller;
  bool first = true;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RotationTransition_Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RotationTransition(
              turns: dondurTween.animate(controller),
              child: Container(
                width: 200,
                height: 200,
                child: FlutterLogo(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                if (first == true) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
                first = !first;
              },
              child: Text("Döndür"),
            )
          ],
        ),
      ),
    );
  }
}
