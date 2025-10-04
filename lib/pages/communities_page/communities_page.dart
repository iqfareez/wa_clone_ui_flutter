import 'package:flutter/material.dart';

class CommunitiesPage extends StatelessWidget {
  const CommunitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Material(
            color: Colors.grey.shade400,
            shape: RoundedSuperellipseBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.people, color: Colors.white),
            ),
          ),
          title: Text('New Community'),
          onTap: () {
            // Handle tap
          },
        )
      ],
    );
  }
}
