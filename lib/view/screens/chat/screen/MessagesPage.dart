import 'package:flutter/material.dart';
import '../widget/message_tile.dart';
import 'chat_screen.dart' hide MessageTile;

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          MessageTile(
            imageUrl: 'https://i.pravatar.cc/150?img=1',
            name: 'Annette Black',
            message: "Yes, that’s gonna work, hopefully.",
            time: '18:31 PM',
            isOnline: true,
            isSelected: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Annette Black',
                    imageUrl: 'https://i.pravatar.cc/150?img=1',
                    email: 'annette@example.com',
                  ),
                ),
              );
            },
          ),
          MessageTile(
            imageUrl: 'https://i.pravatar.cc/150?img=2',
            name: 'Jane Cooper',
            message: "Sure, I’ll get back to you soon!",
            time: '16:12 PM',
            isOnline: false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(
                    name: 'Jane Cooper',
                    imageUrl: 'https://i.pravatar.cc/150?img=2',
                    email: 'jane.cooper@example.com',
                  ),
                ),
              );
            },
          ),
          MessageTile(
            imageUrl: 'https://i.pravatar.cc/150?img=3',
            name: 'Jenny Wilson',
            message: "See you tomorrow!",
            time: '12:05 PM',
            isOnline: false,
          ),
          MessageTile(
            imageUrl: 'https://i.pravatar.cc/150?img=4',
            name: 'Esther Howard',
            message: "Great, thanks for letting me know.",
            time: '09:41 AM',
            isOnline: true,
          ),
        ],
      ),
    );
  }
}
