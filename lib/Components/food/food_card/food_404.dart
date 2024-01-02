import 'package:flutter/material.dart';

class Food404 extends StatelessWidget {
  const Food404({super.key, required this.haveFilters});
  final bool haveFilters;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Sorry!',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 56, 42, 1),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          haveFilters
              ? " We don't have a meal for this preference yet."
              : "Couldn't fetch any meals.",
          maxLines: 2,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color.fromARGB(255, 56, 42, 1),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
