import 'package:flutter/material.dart';

class VideoDurationLabelWidget extends StatelessWidget {
  const VideoDurationLabelWidget({
    super.key,
    required this.duration,
  });

  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.black54),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text(
        duration,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
