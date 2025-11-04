import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            "Privacy Policy\n\n"
                "We value your privacy and protect your data.\n\n"
                "1. Information Collection\nWe collect user data for service improvement.\n\n"
                "2. Data Usage\nWe never sell user information.",
            style: TextStyle(height: 1.5),
          ),
        ),
      ),
    );
  }
}
