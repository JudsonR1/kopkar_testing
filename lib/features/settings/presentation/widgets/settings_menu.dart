import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  final bool isDestructive;

  const SettingsMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        horizontalTitleGap: 8,
        contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        trailing: isDestructive 
            ? null 
            : const Icon(Icons.chevron_right, color: Colors.grey, size: 40,),
      );
    
  }
}