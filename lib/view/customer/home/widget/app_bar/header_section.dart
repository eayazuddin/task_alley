import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String userName;
  final String welcomeText;
  final String profileImageUrl;

  const HeaderSection({
    super.key,
    required this.userName,
    required this.welcomeText,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          /// Profile image from network
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: NetworkImage(profileImageUrl),
            onBackgroundImageError: (_, __) {},
          ),

          const SizedBox(width: 10),

          /// Greeting text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello $userName",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                welcomeText,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const Spacer(),

          /// Notification icon with border
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 1.2),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.teal,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
