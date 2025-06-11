import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble(
      {
        super.key,
        required this.message,
        required this.isSender,
        required this.color
      });

  final String message;
  final bool isSender;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            bottomLeft: isSender ? Radius.circular(15) : Radius.zero,
            bottomRight: isSender ? Radius.circular(15) : Radius.zero
        )
      ),
      child: Text(message),
    );
  }
}