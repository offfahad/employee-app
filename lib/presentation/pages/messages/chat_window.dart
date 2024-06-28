import 'package:employee/const.dart';
import 'package:employee/presentation/pages/messages/models/conversion_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatWindow extends StatelessWidget {
  final Conversation conversation;
  final TextEditingController messageController = TextEditingController();

  ChatWindow({required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          conversation.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor, // Customizing app bar color
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: [
                // Chat bubbles go here
                buildMessageBubble('Hello!', isMe: false),
                buildMessageBubble('Hi there!', isMe: true),
                buildMessageBubble('How are you?', isMe: false),
                buildMessageBubble('I\'m doing great, thanks!', isMe: true),
                buildMessageBubble('Can we discuss the project?', isMe: false),
                buildMessageBubble('Sure, when are you available?', isMe: true),
                buildMessageBubble('Tomorrow afternoon works for me.',
                    isMe: false),
                buildMessageBubble('Perfect, see you then!', isMe: true),
                buildMessageBubble('Do you have the latest updates?',
                    isMe: false),
                buildMessageBubble('Yes, I just sent them to you.', isMe: true),
                // Add more messages as needed
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors
                                .grey), // Border color when the field is enabled
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color:
                                primaryColor), // Border color when the field is focused
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    // Send message logic
                    // Here you would typically send the message
                    // and add it to the chat window
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessageBubble(String message, {required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          message,
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
