import 'package:employee/const.dart';
import 'package:flutter/material.dart';

class PayrollPage extends StatelessWidget {
  const PayrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          "Payrolls",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Earnings Overview
            Container(
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
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earnings Overview',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gross Earnings:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          '\$5,000.00',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Net Earnings:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          '\$4,200.00',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Pay Slip Access
            Container(
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
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: const Icon(Icons.picture_as_pdf,
                    size: 40.0, color: primaryColor),
                title: const Text(
                  'Pay Slip Access',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                    'View and download pay slips for current and past pay periods.'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle pay slip access
                },
              ),
            ),

            // Payroll Details
            Container(
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
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payroll Details',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Earnings:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          '\$5,000.00',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Deductions:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          '\$800.00',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Taxes:',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          '\$300.00',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
