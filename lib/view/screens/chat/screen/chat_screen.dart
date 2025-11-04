import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String email;

  const ChatScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.email,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> messages = [
    {
      "isMe": true,
      "text": ["Hello!", "How are you doing today?"],
      "time": "FRI AT 16:44 PM",
    },
    {
      "isMe": false,
      "text": ["Hey there!", "I’m good, thanks for asking 😊"],
      "time": "FRI AT 16:46 PM",
    },
    {
      "isMe": true,
      "text": ["Glad to hear that!"],
      "time": "FRI AT 16:47 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.name,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ---- Profile Header ----
            const SizedBox(height: 10),
            Column(
              children: [
                CircleAvatar(radius: 45, backgroundImage: NetworkImage(widget.imageUrl)),
                const SizedBox(height: 10),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(widget.email, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 15),
              ],
            ),
            const Divider(height: 1, color: Colors.grey),

            // ---- Chat Messages ----
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        msg["time"],
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: msg["isMe"]
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: msg["text"]
                            .map<Widget>(
                              (t) => ChatBubble(isMe: msg["isMe"], text: t),
                        )
                            .toList(),
                      ),
                    ],
                  );
                },
              ),
            ),

            // ---- Message Input ----
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.white,
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.emoji_emotions_outlined, color: Colors.teal),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Aa",
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: const BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String text;

  const ChatBubble({super.key, required this.isMe, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
        bottom: 6,
        left: isMe ? 60 : 0,
        right: isMe ? 0 : 60,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isMe ? const Color(0xFFE6F4F1) : const Color(0xFFEFF9F7),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
          bottomRight: isMe ? Radius.zero : const Radius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }
}
