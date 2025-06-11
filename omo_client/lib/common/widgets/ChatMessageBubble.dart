import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.isSender,
    required this.color,
  });

  final String message;
  final bool isSender;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: isSender ? Radius.circular(15) : Radius.zero,
                  bottomRight: isSender ? Radius.zero : Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }
}
