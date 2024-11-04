import 'package:flutter/material.dart';

class GeneralScreenTimer extends StatelessWidget {
  const GeneralScreenTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '15',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(width: 10),
              Text(
                's',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Start"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Stop"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Clear"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
