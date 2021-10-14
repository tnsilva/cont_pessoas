import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Mundo invertido?";
      } else if (_people <= 10) {
        _infoText = "Pode entrar!";
      } else {
        _infoText = "Lotado.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    child: const Text("+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    child: const Text("-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                )
              ],
            ),
            Text(
              _infoText,
              style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
