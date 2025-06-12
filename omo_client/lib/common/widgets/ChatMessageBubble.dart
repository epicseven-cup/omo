import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.isSender,
    required this.backgroundColor,
    required this.textColor
  });

  final String message;
  final bool isSender;
  final Color backgroundColor;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: isSender ? Radius.circular(40) : Radius.zero,
                  bottomRight: isSender ? Radius.zero : Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Text(message, style: TextStyle(
                color: textColor
              ),),
            ),
        ],
      ),
    );
  }
}
