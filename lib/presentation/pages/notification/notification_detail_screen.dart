import 'package:employee/const.dart';
import 'package:employee/presentation/pages/notification/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class NotificationDetailsScreen extends StatelessWidget {
  final NotificationModel notification;

  NotificationDetailsScreen({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Notification Details', style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor, // Customizing app bar color
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              notification.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Received at ${notification.time}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
