import 'dart:math' as math;
import 'dart:ui';

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
  late Animation<Offset> _offset;
  late Animation<Offset> _offsetMain;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _offset = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));

    // _offsetMain = Tween<Offset>(
    //   begin: Offset.zero,
    //   end: Offset(0.2, 0.0),
    // ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    _controller.addStatusListener((status) {
      if (status.isAnimating) {
        setState(() {
          _navigationMenuOpen = true;
        });
      }

      if (status.isDismissed) {
        setState(() {
          _navigationMenuOpen = false;
        });
      }
    });
  }

  void closeMenu() {
    _controller.reverse();
  }

  void openMenu() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).secondaryHeaderColor,
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (!_navigationMenuOpen) {
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
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Cutting off the last reminding of the animation since it will pop itself up making it look weird
              if (_controller.value > 0.2) {
                return SizedBox(
                  width: 200 * _controller.value,
                  child: SlideTransition(
                    position: _offset,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Theme
                                .of(context)
                                .dividerColor,
                          ),
                        ),
                      ),
                      child: Column(
                        // Should I force it to be ListTiles?
                        children: widget.menuItems,
                      ),
                    ),
                  ),
                );
              }else {
                return SizedBox.shrink();
              }
            },
          ),

          Expanded(child: Center(child: widget.mainContent)),
        ],
      ),
    );
  }
}
