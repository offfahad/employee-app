import 'package:employee/const.dart';
import 'package:employee/presentation/pages/notification/model/notification_model.dart';
import 'package:employee/presentation/pages/notification/notification_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications = [
      NotificationModel(
        title: 'Shift Change',
        description: 'Your shift for tomorrow has been updated.',
        time: '10:00 AM',
      ),
      NotificationModel(
        title: 'Payroll Update',
        description: 'Your latest payroll details are now available.',
        time: 'Yesterday',
      ),
      NotificationModel(
        title: 'System Announcement',
        description: 'There will be a system maintenance downtime tonight.',
        time: '2 days ago',
      ),
      // Add more notifications as needed
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          
          IconButton(
            onPressed: () {
              _showDialogAll(context, notifications);
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
        padding: EdgeInsets.symmetric(vertical: 20),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              onLongPress: () {
                _showDialog(context, notifications, index);
              },
              title: Text(
                notifications[index].title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(notifications[index].description),
              trailing: Text(notifications[index].time),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NotificationDetailsScreen(
                      notification: notifications[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> _showDialog(
      BuildContext context, List<NotificationModel> notifications, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Notification?'),
          content:
              const Text('Are you sure you want to delete this notification?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                // Implement your delete logic here
                // For example, you can remove the notification from the list
                setState(() {
                  notifications.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}

Future<dynamic> _showDialogAll(
    BuildContext context, List<NotificationModel> notifications) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Notifications?'),
        content:
            const Text('Are you sure you want to delete all notification?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              // Implement your delete logic here
              // For example, you can remove the notification from the list
              // setState(() {
              //   notifications.removeAt(index);
              // });
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
