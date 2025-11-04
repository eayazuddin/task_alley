import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Terms & Condition")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            "Terms and Conditions\n\n"
                "1. User Agreement\nYou agree to follow all app guidelines.\n\n"
                "2. Account Information\nKeep your credentials safe.\n\n"
                "3. Service Usage\nWe may modify terms anytime.",
            style: TextStyle(height: 1.5),
          ),
        ),
      ),
    );
  }
}
