import 'package:flutter/material.dart';

class ProfileOptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool arrowHide;

  const ProfileOptionTile({
    super.key,
    required this.title,
    required this.icon,
     this.onTap,
    this.arrowHide = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: arrowHide == false ?  Icon(Icons.chevron_right, color: Colors.teal) : SizedBox(),
        onTap: onTap ?? () {},
      ),
    );
  }
}
