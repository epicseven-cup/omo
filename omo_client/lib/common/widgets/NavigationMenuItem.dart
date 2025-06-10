import 'package:flutter/material.dart';
import 'package:omo_client/common/widgets/NavigationMenu.dart';

class NavigationMenuItem extends StatelessWidget {
  const NavigationMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        Row(children: [Expanded(child: icon), Expanded(child: Text(title))]),
      ),
    );
  }
}
