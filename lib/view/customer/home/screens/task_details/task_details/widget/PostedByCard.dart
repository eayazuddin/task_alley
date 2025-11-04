import 'package:flutter/material.dart';

class PostedByCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const PostedByCard({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(width: 12),
        // Texts
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Posted by",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
