import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String memberId;

  const HomeHeader({
    super.key,
    required this.userName,
    required this.memberId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 100), // Extra bottom padding for overlap
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color(0xFF4A00E0), // Purple-ish blue
            // Color(0xFF000080), // Dark Blue
            Color.fromARGB(0, 255, 255, 255),
            Color.fromARGB(0, 255, 255, 255)
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          // Avatar
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=32'), // Mock image
          ),
          const SizedBox(width: 12),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Hi, $userName",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  memberId,
                  style: TextStyle(
                    color: const Color.fromARGB(200, 255, 255, 255),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Notification Icons
          const SizedBox(width: 10),
        ],
      ),
    
    );
  }
}