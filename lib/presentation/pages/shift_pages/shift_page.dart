import 'package:employee/const.dart';
import 'package:employee/presentation/pages/shift_pages/shift_detail_page.dart';
import 'package:flutter/material.dart';

class ShiftPage extends StatefulWidget {
  const ShiftPage({super.key});

  @override
  State<ShiftPage> createState() => _ShiftPageState();
}

class _ShiftPageState extends State<ShiftPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

// Mock data for past shifts
  final List<Map<String, String>> pastShifts = [
    {
      'date': '2024-03-30',
      'day': 'SAT',
      'role': 'Warehouse Operative WKEND',
      'company': 'Bleckmann UK Ltd (Torando)',
      'location': 'Lutterworth, Leicestershire, LE17 4XP',
      'clockIn': '15:00',
      'clockOut': '00:00',
    },
    {
      'date': '2024-03-25',
      'day': 'MON',
      'role': 'Warehouse Operative WKEND',
      'company': 'Bleckmann UK Ltd (Torando)',
      'location': 'Lutterworth, Leicestershire, LE17 4XP',
      'clockIn': '15:00',
      'clockOut': '00:00',
    },
    // Add more shift data here
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    _buildShifts() {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ShiftDetailPage(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          height: 100.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "30",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "SAT",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Warehouse Operative WKEND (15:00-00:00)",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: primaryColor),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Bleckmann UK Ltd (Torando)",
                    style: const TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Lutterworth, Leicestershire, LE17 4XP",
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: primaryColor,
                size: 16,
              ),
            ],
          ),
        ),
      );
    }

    _buildScheduledShifts() {
      return ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "March, 2024",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          ...List.generate(2, (index) => _buildShifts()),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "April, 2024",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          ...List.generate(8, (index) => _buildShifts()),
        ],
      );
    }

    // _buildHistoryShifts() {
    //   return ListView(
    //     children: [
    //       const Padding(
    //         padding: EdgeInsets.only(left: 15, top: 15),
    //         child: Text(
    //           "January, 2024",
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    //         ),
    //       ),
    //       ...List.generate(5, (index) => _buildShifts()),
    //       const Padding(
    //         padding: EdgeInsets.only(left: 15, top: 10),
    //         child: Text(
    //           "February, 2024",
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    //         ),
    //       ),
    //       ...List.generate(3, (index) => _buildShifts()),
    //     ],
    //   );
    // }

    _buildPastShifts() {
      return ListView.builder(
        itemCount: pastShifts.length,
        itemBuilder: (context, index) {
          final shift = pastShifts[index];
          return Container(
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${shift['date']} (${shift['day']})",
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    shift['role']!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    shift['company']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    shift['location']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Clock In: ${shift['clockIn']}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Clock Out: ${shift['clockOut']}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: primaryColor,
                size: 16,
              ),
              onTap: () {
                // Handle tap if necessary
              },
            ),
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: const Text(
            "My Shifts",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            labelStyle: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
            unselectedLabelStyle:
                const TextStyle(fontSize: 18.0, color: Colors.white70),
            indicatorWeight: 4.0,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                text: 'Scheduled',
              ),
              Tab(
                text: 'History',
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildScheduledShifts(),
            _buildPastShifts(),
          ],
        ));
  }
}
