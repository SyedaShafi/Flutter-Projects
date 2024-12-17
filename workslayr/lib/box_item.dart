import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subText;
  final Color backgroundColor;
  final Color textColor;
  final Color subTextColor;

  const BoxItem({
    super.key,
    required this.icon,
    required this.text,
    required this.subText,
    required this.backgroundColor,
    required this.textColor,
    required this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Center(
                // child: SvgPicture.asset(
                //   icon,
                //   height: 40,
                //   width: 40,
                //   color: subTextColor,
                // ),
                child: Icon(icon, color: subTextColor),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subText,
                    style: TextStyle(
                      color: subTextColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
