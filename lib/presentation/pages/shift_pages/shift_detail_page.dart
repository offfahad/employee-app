import 'package:employee/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ShiftDetailPage extends StatefulWidget {
  @override
  _ShiftDetailPageState createState() => _ShiftDetailPageState();
}

class _ShiftDetailPageState extends State<ShiftDetailPage> {
  bool isCheckedIn = false;

  void toggleCheckIn() {
    setState(() {
      isCheckedIn = !isCheckedIn;
    });
  }

  void acknowledgeShift() {
    // Handle acknowledge shift logic
  }

  void flagIssue() {
    // Handle flag issue logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          'Shift Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ListTile(
              title: const Text(
                'Warehouse Operative WKEND',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              subtitle: const Text(
                'Bleckmann UK Ltd (Tornado)',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              trailing: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_downward_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shift Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Date: March 30, 2024\nTime: 15:00 - 00:00\nLocation: Lutterworth, Leicestershire, LE17 4XP',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey.shade300,
                child: const Icon(
                  Icons.lock,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'SHIFT STARTS IN 2 DAYS',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'CHECK-IN AVAILABLE 15 MINUTES\nBEFORE SHIFT STARTS',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: ElevatedButton(
                onPressed: toggleCheckIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text(
                  isCheckedIn ? 'Check-Out' : 'Check-In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: acknowledgeShift,
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text(
                    'Acknowledge Shift',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: flagIssue,
                  icon: const Icon(Icons.flag, color: Colors.white),
                  label: const Text(
                    'Flag an Issue',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
