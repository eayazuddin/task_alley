import 'package:flutter/material.dart';
import '../../../widget/primary_button.dart';
import '../../../widget/profile_text_field.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final message = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("How can we help you?",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ProfileTextField(label: "Type your message", controller: message),
            const SizedBox(height: 16),
            PrimaryButton(text: "Send", onPressed: () {}),
            const SizedBox(height: 20),
            const Text("Need more help? Visit: support@finserve.com",
                style: TextStyle(color: Colors.teal)),
          ],
        ),
      ),
    );
  }
}
