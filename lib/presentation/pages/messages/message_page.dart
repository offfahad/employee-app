import 'package:employee/const.dart';
import 'package:employee/presentation/pages/messages/chat_window.dart';
import 'package:employee/presentation/pages/messages/models/conversion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Conversation> conversations = [
      Conversation(
        name: 'John Smith',
        message: 'Hey, how are you?',
        time: '10:00 AM',
      ),
      Conversation(
        name: 'Emily Johnson',
        message: 'Can we discuss the project?',
        time: '11:30 AM',
      ),
      Conversation(
        name: 'Michael Brown',
        message: 'I need your help with something.',
        time: '12:45 PM',
      ),
      Conversation(
        name: 'Maria Garcia',
        message: 'When can we meet?',
        time: '2:00 PM',
      ),
      Conversation(
        name: 'James Wilson',
        message: 'Great job on the presentation!',
        time: '3:30 PM',
      ),
      Conversation(
        name: 'Sarah Martinez',
        message: 'Let\'s finalize the details.',
        time: '4:15 PM',
      ),
      Conversation(
        name: 'Robert Johnson',
        message: 'Looking forward to the event.',
        time: '5:00 PM',
      ),
      Conversation(
        name: 'Linda Brown',
        message: 'Do you have the latest report?',
        time: '6:20 PM',
      ),
      Conversation(
        name: 'William Jones',
        message: 'Any updates on the project?',
        time: '7:45 PM',
      ),
      Conversation(
        name: 'Patricia Davis',
        message: 'Could you send me the file?',
        time: '9:00 PM',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.white),
        ),
                actions: [
          
          IconButton(
            onPressed: () {
             showDeleteConfirmationDialog(context);
            },
            icon: const Icon(
              IconlyBold.delete,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyBold.tickSquare,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        padding: const EdgeInsets.only(top: 10),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: primaryColor,
                  child: Text(
                    conversations[index].name[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            title: Text(
              conversations[index].name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              conversations[index].message,
            ),
            trailing: Text(conversations[index].time),
            onTap: () {
              Get.to(() => ChatWindow(conversation: conversations[index]));
            },
          );
        },
      ),
    );
  }

void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Chats'),
          content: Text('Are you sure you want to delete all chats?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete', style: TextStyle(color: Colors.black),),
              onPressed: () {
                // Perform delete operation here
                // Example: Get.find<Controller>().deleteItem();
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}