import 'package:flutter/material.dart';
import 'package:omo_client/common/screens/home_screen.dart';
import 'package:omo_client/common/widgets/ChatMessageBubble.dart';

class ChatDisplay extends StatefulWidget {
  const ChatDisplay({super.key, });

  @override
  State<StatefulWidget> createState() => _ChatDisplayState();
}


class _ChatDisplayState extends State<ChatDisplay> {
  final List<Widget> messages = [
    ChatMessageBubble(message: "Hello", isSender: false, backgroundColor: Colors.blue, textColor: Colors.white,),
    ChatMessageBubble(message: "Hi", isSender: true, backgroundColor: Colors.green, textColor: Colors.black,),
    ChatMessageBubble(message: "How is your day", isSender: false, backgroundColor: Colors.blue, textColor: Colors.white,),
    ChatMessageBubble(message: "How is your day", isSender: false, backgroundColor: Colors.blue, textColor: Colors.white,),
    ChatMessageBubble(message: "How is your day", isSender: false, backgroundColor: Colors.blue, textColor: Colors.white,),
    ChatMessageBubble(message: "How is your day", isSender: false, backgroundColor: Colors.blue, textColor: Colors.white,),
    ChatMessageBubble(message: "How is your day", isSender: false, backgroundColor: Colors.blue, textColor: Colors.white,),
    ChatMessageBubble(message: "How is your day", isSender: false, backgroundColor: Colors.blue, textColor: Colors.white,),
    ChatMessageBubble(message: "How is your day", isSender: false, backgroundColor: Colors.blue, textColor: Colors.white,),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
        ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index){
            return messages[index];
          });
  }
}