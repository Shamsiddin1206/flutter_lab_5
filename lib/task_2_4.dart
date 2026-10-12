import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const profile = '/profile';
  static const messages = '/messages';
  static const about = '/about';
}

void main() {
  runApp(MaterialApp(
    initialRoute: AppRoutes.home,
    routes: {
      AppRoutes.home: (context) => const SectionScreen(
            title: 'Home',
            icon: Icons.home,
            route: AppRoutes.home,
          ),
      AppRoutes.profile: (context) => const SectionScreen(
            title: 'Profile',
            icon: Icons.person,
            route: AppRoutes.profile,
          ),
      AppRoutes.messages: (context) => const SectionScreen(
            title: 'Messages',
            icon: Icons.message,
            route: AppRoutes.messages,
          ),
      AppRoutes.about: (context) => const SectionScreen(
            title: 'About',
            icon: Icons.info,
            route: AppRoutes.about,
          ),
    },
  ));
}

class AppDrawer extends StatelessWidget {
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  void _open(BuildContext context, String route) {
    final NavigatorState navigator = Navigator.of(context);
    navigator.pop();
    if (route != currentRoute) {
      navigator.pushReplacementNamed(route);
    }
  }

  Widget _item(
    BuildContext context,
    IconData icon,
    String label,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: route == currentRoute,
      onTap: () => _open(context, route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text('Menu', style: TextStyle(fontSize: 24)),
            ),
          ),
          _item(context, Icons.home, 'Home', AppRoutes.home),
          _item(context, Icons.person, 'Profile', AppRoutes.profile),
          _item(context, Icons.message, 'Messages', AppRoutes.messages),
          _item(context, Icons.info, 'About', AppRoutes.about),
        ],
      ),
    );
  }
}

class SectionScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const SectionScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: AppDrawer(currentRoute: route),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 72),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}
