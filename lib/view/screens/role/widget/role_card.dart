import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  final String role;
  final String title;
  final String imagePath;
  final bool isSelected;
  final double right;
  final double bottom;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.role,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.right,
    required this.bottom,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.teal : Colors.transparent,
            width: 3,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: double.infinity,
            height: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  right: right,
                  bottom: bottom,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    color: Colors.teal.withOpacity(0.1),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
