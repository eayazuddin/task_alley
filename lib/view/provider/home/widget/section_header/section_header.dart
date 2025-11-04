import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color viewAllColor;
  final VoidCallback? onViewAll;
  final bool showViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.titleColor = const Color(0xFF006D67), // default teal color
    this.viewAllColor = const Color(0xFF006D67),
    this.onViewAll,
    this.showViewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Title with leading icon
        Row(
          children: [
            const Icon(Icons.label_outline, size: 18, color: Colors.grey),
            const SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
            ),
          ],
        ),

        /// "View all" button
        GestureDetector(
          onTap: onViewAll,
          child: Text(
            showViewAll ? "View all" : "",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: viewAllColor,
            ),
          ),
        ),
      ],
    );
  }
}
