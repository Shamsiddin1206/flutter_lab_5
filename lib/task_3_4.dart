import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.grey;

  Future<void> _chooseColor() async {
    final Color? chosen = await Navigator.push<Color>(
      context,
      MaterialPageRoute(builder: (context) => const ColorScreen()),
    );

    if (!mounted) return;

    if (chosen != null) {
      setState(() => _color = chosen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _chooseColor,
              child: const Text('Choose colour'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  Widget _colorButton(BuildContext context, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          minimumSize: const Size(160, 48),
        ),
        onPressed: () => Navigator.pop(context, color),
        child: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 2')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _colorButton(context, 'Red', Colors.red),
            _colorButton(context, 'Green', Colors.green),
            _colorButton(context, 'Blue', Colors.blue),
          ],
        ),
      ),
    );
  }
}
