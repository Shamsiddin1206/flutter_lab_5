import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class BackOrExitButton extends StatelessWidget {
  const BackOrExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bool canGoBack = Navigator.canPop(context);

    return ElevatedButton(
      onPressed: canGoBack ? () => Navigator.pop(context) : null,
      child: Text(canGoBack ? 'Back' : 'Nothing to go back to'),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home (root screen)')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BackOrExitButton(),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Open second screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second (pushed screen)'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(child: BackOrExitButton()),
    );
  }
}
