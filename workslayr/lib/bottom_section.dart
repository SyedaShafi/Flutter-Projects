import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Text(
                  'My Tasks',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.arrow_forward,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(14.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularPercentIndicator(
                  radius: 26.0,
                  lineWidth: 5.0,
                  percent: 0.8,
                  center: const Text(
                    '80%',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: const Color(0xFFFFDAD4),
                  progressColor: const Color(0xFFE42D1A),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plumbing Service',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF231918),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Short Details goes here...',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF534341),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xFFD8C2BE),
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Doing',
                    style: TextStyle(
                      color: Color(0xFF534341),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
