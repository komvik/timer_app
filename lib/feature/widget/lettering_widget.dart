import 'package:flutter/material.dart';

class LetteringWidget extends StatelessWidget {
  const LetteringWidget({super.key, required this.chr});

  final String chr;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: SizedBox(
        width: 50,
        child: Text(
          chr,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
