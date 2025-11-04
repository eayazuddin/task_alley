import 'package:flutter/material.dart';

class AskQuestionBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onImagePick;

  const AskQuestionBox({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onImagePick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F6F3), // light mint background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 📷 Image upload button
          GestureDetector(
            onTap: onImagePick,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.image_outlined,
                color: Color(0xFF0E7C5F),
                size: 28,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 💬 Text field
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: 4,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: "Ask a question",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 🚀 Send button
          ElevatedButton(
            onPressed: onSend,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0E7C5F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text(
              "Send",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
