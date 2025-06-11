import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omo_client/common/widgets/ChatDisplay.dart';

import '../widgets/NavigationMenu.dart';
import '../widgets/NavigationMenuItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

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
      title: "OmO",
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

        ListView.builder(itemBuilder: (context, index){
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
              title: _chats[index],
            ),
          );
        })

      ],
    );
  }
}
