import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class messageBubble extends StatelessWidget {
  const messageBubble({
    super.key,
    required this.message,
    required this.color,
    required this.alignment,
    required this.nip,
  });
  final String message;
  final Color color;
  final Alignment alignment;
  final BubbleNip nip;

  @override
  Widget build(BuildContext context) {
    return Bubble(
      margin: const BubbleEdges.only(top: 10, left: 10, right: 10),
      alignment: alignment,
      nip: nip,
      color: color,
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
