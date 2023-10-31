import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  Badges({
   
    required this.childs,
    required this.value,
    required this.color,
  });

  final Widget childs;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        childs,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color != null ? color : Theme.of(context).accentColor,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
