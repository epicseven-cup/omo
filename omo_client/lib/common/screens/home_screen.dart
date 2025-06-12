import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omo_client/common/widgets/ChatDisplay.dart';

import '../widgets/NavigationMenu.dart';
import '../widgets/NavigationMenuItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;
  // This data will be fetch via websocket
  static const List<String> chats = [
    "Group Chat #1",
    "Group Chat #2",
    "Group Chat #3",
    "Group Chat #4",
    "Group Chat #5",
    "Group Chat #6",
    "Group Chat #7",
    "Group Chat #8",
    "Group Chat #9",
    "Group Chat #10",
    "Group Chat #11",
    "Group Chat #12",
    "Group Chat #13",
    "Group Chat #14",
    "Group Chat #15",
  ];
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return NavigationMenu(
      mainContent:
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          GestureDetector(
            onTap: () {
              // unfocus element, dismiss keyboard etc, can be call without checking if anything if foucs, but can cause issues down the line
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(child: ChatDisplay()),
                  SafeArea(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            labelText: 'Send your message here',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.access_alarm),
                            ),
                            // Expanded(child: Text("")),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.send),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      duration: Duration(milliseconds: 500),
      title: widget.title,
      menuItems: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  // borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () {
                if (kDebugMode) {
                  print("Button Clicked");
                }
              },
              child: NavigationMenuItem(
                icon: Icon(Icons.add),
                title: "New Chat",
              ),
        ),

            ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onPressed: () {
            if (kDebugMode) {
              print("Button Clicked");
            }
          },
          child: NavigationMenuItem(
            icon: Icon(Icons.group_add),
            title: "Join Chat",
          ),
        ),

        Divider(),

        Flexible(child:
        ListView.builder(
          itemCount: HomeScreen.chats.length,
            itemBuilder: (context, index){
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: () {
              if (kDebugMode) {
                print("Button Clicked");
              }
            },
            child: NavigationMenuItem(
              icon: Icon(Icons.group),
              // Idk weird access here
              title: HomeScreen.chats[index],
            ),
          );
        })),
        
        Divider(),
        Column(
          children: [
            NavigationMenuItem(icon: Icon(Icons.login), title: "Login"),
            NavigationMenuItem(icon: Icon(Icons.add), title: "Signup"),
          ],
        )

      ],
    );
  }
}
