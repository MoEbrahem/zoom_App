import 'package:flutter/material.dart';
import 'package:zoom_app/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onchange;
  const MeetingOption({super.key, required this.text, required this.onchange, required this.isMute,});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryBackgroundColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch.adaptive(
            value: isMute,
            onChanged: onchange,
          )
        ],
      ),
    );
  }
}
