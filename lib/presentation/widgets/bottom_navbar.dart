import 'package:employee/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavbar extends StatefulWidget {
  int currentIndex;
  Function ontap;
  final int messageCount;
  final int notificationCount;

  BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.ontap,
    required this.messageCount,
    required this.notificationCount,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  Widget _buildIconWithBadge(IconData icon, int count) {
    return Stack(
      children: [
        Icon(icon, size: 35),
        if (count > 0)
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: primaryColor,
      elevation: 0,
      currentIndex: widget.currentIndex,
      iconSize: 35,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        widget.ontap(value);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
              widget.currentIndex == 0 ? Icons.dashboard_rounded : Icons.dashboard_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 1
              ? Icons.access_time_filled
              : Icons.access_time),
          label: "Shifts",
        ),
        BottomNavigationBarItem(
          icon: Icon(widget.currentIndex == 2
              ? Icons.payments
              : Icons.payments_outlined),
          label: "Payrolls",
        ),
        BottomNavigationBarItem(
          icon: _buildIconWithBadge(
            widget.currentIndex == 3 ? Icons.message : Icons.message,
            widget.messageCount,
          ),
          label: "Messages",
        ),
        BottomNavigationBarItem(
          icon: _buildIconWithBadge(
            widget.currentIndex == 4 ? Icons.notifications : Icons.notifications_none,
            widget.notificationCount,
          ),
          label: "Notification",
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(widget.currentIndex == 5
        //       ? Icons.person
        //       : Icons.person),
        //   label: "Profile",
        // ),
      ],
    );
  }
}
