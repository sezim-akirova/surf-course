import 'package:flutter/material.dart';

void main() {
  runApp(GestureMasterApp());
}

class GestureMasterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gesture Master'),
        ),
        body: GestureMasterWidget(),
      ),
    );
  }
}

class GestureMasterWidget extends StatefulWidget {
  const GestureMasterWidget({super.key});

  @override
  _GestureMasterWidgetState createState() => _GestureMasterWidgetState();
}

class _GestureMasterWidgetState extends State<GestureMasterWidget> {
  Color _color = Colors.blue;
  double _width = 100.0;
  double _height = 100.0;
  double _rotation = 0.0;
  Offset _position = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _position += details.delta;
              });
            },
            onTap: () {
              setState(() {
                _color = _color == Colors.blue ? Colors.red : Colors.blue;
              });
            },
            onLongPress: () {
              setState(() {
                _rotation += 45.0;
              });
            },
          ),
        ),
        Positioned(
          left: _position.dx,
          top: _position.dy,
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(_rotation / 360),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: _width,
              height: _height,
              color: _color,
            ),
          ),
        ),
      ],
    );
  }
}
