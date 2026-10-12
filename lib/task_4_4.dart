import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;
  final String city;

  const User({required this.name, required this.age, required this.city});
}

const users = [
  User(name: 'Aziz Karimov', age: 21, city: 'Tashkent'),
  User(name: 'Malika Yusupova', age: 19, city: 'Samarkand'),
  User(name: 'Bobur Rakhimov', age: 23, city: 'Bukhara'),
  User(name: 'Dilnoza Saidova', age: 20, city: 'Namangan'),
];

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: (settings) {
      if (settings.name == '/') {
        return MaterialPageRoute(
          builder: (context) => const UserListScreen(),
          settings: settings,
        );
      }

      if (settings.name == '/profile') {
        final Object? args = settings.arguments;
        if (args is User) {
          return MaterialPageRoute(
            builder: (context) => ProfileScreen(user: args),
            settings: settings,
          );
        }
      }

      return null;
    },
    onUnknownRoute: (settings) {
      return MaterialPageRoute(
        builder: (context) => const NotFoundScreen(),
      );
    },
  ));
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListView(
        children: [
          for (final user in users)
            ListTile(
              leading: CircleAvatar(child: Text(user.name[0])),
              title: Text(user.name),
              subtitle: Text(user.city),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, '/profile', arguments: user);
              },
            ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Name'),
                subtitle: Text(user.name),
              ),
              ListTile(
                leading: const Icon(Icons.cake),
                title: const Text('Age'),
                subtitle: Text('${user.age}'),
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: const Text('City'),
                subtitle: Text(user.city),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: const Center(child: Text('Page not found')),
    );
  }
}
