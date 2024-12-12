import 'package:flutter/material.dart';
import 'package:workslayr/bottom_section.dart';
import 'package:workslayr/box_item.dart';

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFE4DCEF),
      body: SafeArea(
        child: Column(
          children: [
            Placeholder(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoxItem(
                          icon: 'assets/task.svg',
                          text: '23',
                          textColor: Colors.white,
                          subText: 'Open Task',
                          backgroundColor: Color(0xFFE42D1A),
                          subTextColor: Colors.white,
                        ),
                        BoxItem(
                          icon: 'assets/work.svg',
                          text: '14',
                          textColor: Colors.black,
                          subText: 'Projects',
                          backgroundColor: Colors.white,
                          subTextColor: Color(0xFF655C5B),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoxItem(
                          icon: 'assets/time.svg',
                          text: '232h 14m',
                          textColor: Colors.black,
                          subText: 'Weekly Logged',
                          backgroundColor: Colors.white,
                          subTextColor: Color(0xFF655C5B),
                        ),
                        BoxItem(
                          icon: 'assets/leave.svg',
                          text: '14',
                          textColor: Colors.black,
                          subText: 'Leaves',
                          backgroundColor: Colors.white,
                          subTextColor: Color(0xFF655C5B),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            BottomSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Text(
          'Footer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
