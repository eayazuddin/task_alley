import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isDanger;
  final VoidCallback onTap;

  const SettingTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isDanger
        ? Colors.red.withOpacity(0.5)
        : const Color(0xFF0E7C7B).withOpacity(0.3);

    final Color textColor = isDanger ? Colors.red : Colors.black87;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: isDanger ? Colors.red : Colors.black87),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: isDanger ? Colors.red : Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
