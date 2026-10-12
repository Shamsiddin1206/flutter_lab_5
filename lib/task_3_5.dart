import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _value = 0;

  Future<void> _edit() async {
    final int? result = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) => EditorScreen(initialValue: _value),
      ),
    );

    if (!mounted) return;

    if (result != null) {
      setState(() => _value = result);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved: $result')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cancelled, old value kept')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Value: $_value', style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _edit,
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditorScreen extends StatefulWidget {
  final int initialValue;

  const EditorScreen({super.key, required this.initialValue});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late int _current = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editor')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => setState(() => _current--),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    '$_current',
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => _current++),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, _current),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
