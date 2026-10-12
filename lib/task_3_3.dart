import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;

  const Contact({
    required this.name,
    required this.phone,
    required this.email,
  });
}

const contacts = [
  Contact(name: 'Aziz Karimov', phone: '+998 90 111 22 33', email: 'aziz@example.com'),
  Contact(name: 'Malika Yusupova', phone: '+998 91 222 33 44', email: 'malika@example.com'),
  Contact(name: 'Bobur Rakhimov', phone: '+998 93 333 44 55', email: 'bobur@example.com'),
  Contact(name: 'Dilnoza Saidova', phone: '+998 94 444 55 66', email: 'dilnoza@example.com'),
  Contact(name: 'Jasur Tursunov', phone: '+998 97 555 66 77', email: 'jasur@example.com'),
];

void main() => runApp(const MaterialApp(home: ContactListScreen()));

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final Contact contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(child: Text(contact.name[0])),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;

  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Text(
                    contact.name[0],
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(height: 32),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(contact.phone),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(contact.email),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
