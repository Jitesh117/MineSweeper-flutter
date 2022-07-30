import 'package:flutter/material.dart';

class MyNumberBox extends StatelessWidget {
  MyNumberBox({Key? key, required this.child, required this.revealed,required this.function})
      : super(key: key);
  final child;
  bool revealed;
  final function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          color: revealed ? Colors.grey.shade300 : Colors.grey.shade400,
          child: Center(
            child: Text(
              child.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
