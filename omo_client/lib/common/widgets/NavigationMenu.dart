import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  final Duration duration;

  final Widget mainContent;
  final List<Widget> menuItems;

  final String title;

  const NavigationMenu({
    super.key,
    this.menuItems = const [],
    required this.mainContent,
    required this.duration,
    required this.title,




  });

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu>
    with SingleTickerProviderStateMixin {
  bool _navigationMenuOpen = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
  }

  void closeMenu() {
    _controller.forward();
  }

  void openMenu() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {
            setState(() {
              _navigationMenuOpen = !_navigationMenuOpen;
              if (_navigationMenuOpen) {
                openMenu();
              } else {
                closeMenu();
              }
            });
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: Row(
        children: [
          // Only return when the menu is open
          _navigationMenuOpen
              ?
          Container(
            width: 220,
            decoration: BoxDecoration(
              border: Border(right:  BorderSide(color: Theme.of(context).dividerColor))
            ),
              child: Column(
                  // Should I force it to be ListTiles?
                  children: widget.menuItems,
                )
          )
              : SizedBox.shrink(),
          Expanded(child: Center(child: widget.mainContent,))
        ],
      ),
    );
  }
}
