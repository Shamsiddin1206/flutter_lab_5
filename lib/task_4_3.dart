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
    routes: {
      '/': (context) => const UserListScreen(),
      '/profile': (context) => const ProfileScreen(),
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
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

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
