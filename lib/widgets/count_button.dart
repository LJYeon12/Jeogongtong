import 'package:flutter/material.dart';

class CountButton extends StatefulWidget {
  int counter;

  CountButton({required this.counter});

  @override
  _CountButtonState createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE3E5E5)),
        borderRadius: BorderRadius.circular(60),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.counter == 0 ? print('counter at 0') : widget.counter--;
              });
            },
            child: Icon(
              Icons.remove,
              color:
                  widget.counter == 0 ? Color(0xffE3E5E5) : Color(0xffFC9AB8),
            ),
          ),
          Text('${widget.counter}'),
          GestureDetector(
            onTap: () {
              setState(() {
                print('set');
                if (widget.counter < 10) widget.counter++;
              });
            },
            child: Icon(
              Icons.add,
              color:
                  widget.counter == 10 ? Color(0xffE3E5E5) : Color(0xffFC9AB8),
            ),
          ),
        ],
      ),
    );
  }
}
