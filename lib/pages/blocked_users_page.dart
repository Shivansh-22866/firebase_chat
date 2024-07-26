import 'package:firebase_chat/components/user_tile.dart';
import 'package:firebase_chat/services/auth/auth_service.dart';
import 'package:firebase_chat/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({super.key});

  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  void _unblockUser(BuildContext context, String userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Unblock User"),
              content: const Text("Are you sure you want to unblock?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      chatService.unblockUser(userId);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("User $userId is unblocked")));
                    },
                    child: const Text("Unblock"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    String userId = authService.getCurrentUser()!.uid;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BLOCKED USERS"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: chatService.getBlockedUsersStream(userId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("An error occurred: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final blockedUsers = snapshot.data ?? [];

          if (blockedUsers.isEmpty) {
            return const Center(child: Text("No blocked users"));
          }

          return ListView.builder(
              itemCount: blockedUsers.length,
              itemBuilder: (context, index) {
                final user = blockedUsers[index];
                return UserTile(
                  text: user["email"],
                  onTap: () => _unblockUser(context, user['uid']),
                );
              });
        },
      ),
    );
  }
}
