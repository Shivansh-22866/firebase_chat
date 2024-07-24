import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String timestamp;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isCurrentUser,
      required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isCurrentUser ? Colors.green[400] : Colors.grey.shade500,
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            timestamp,
            style: TextStyle(color: Colors.grey.shade200, fontSize: 8),
          ),
        ],
      ),
    );
  }
}
