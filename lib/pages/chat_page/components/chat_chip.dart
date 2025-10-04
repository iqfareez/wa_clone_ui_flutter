import 'package:flutter/material.dart';

import '../../../utils/wa_brand_colour.dart';

/// The Action Chip for chat categories in Chat Page
class ChatChip extends StatelessWidget {
  const ChatChip(
      {Key? key,
      required this.selected,
      required this.label,
      required this.onPressed})
      : super(key: key);

  final bool selected;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding for inside chip
      padding: const EdgeInsets.all(2.0),
      child: ActionChip(
        onPressed: onPressed,
        label: Text(label),
        padding: EdgeInsets.all(3),
        backgroundColor: selected ? WaBrandColour.outgoingChatBubble : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
