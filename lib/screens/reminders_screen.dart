import 'package:flutter/material.dart';

class RemindersScreen extends StatelessWidget {
  final List<Map<String, String>> reminders = [
    {'title': 'Quando a gente se conheceu', 'date': '14/10/2024'},
    {'title': 'Dia da Minha Declaração', 'date': '09/11/2024'},
    {'title': 'Nosso primeiro beijo', 'date': '16/11/2024'},
    {'title': 'Primeiro "Te amo muitão"', 'date': '19/11/2024'},
    {'title': 'Quando Começamos a Namorar', 'date': '23/01/2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lembretes')),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: reminders.length,
        separatorBuilder: (_, __) => Divider(height: 24),
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return ListTile(
            leading: Icon(Icons.event, color: Colors.pink),
            title: Text(reminder['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(reminder['date']!),
          );
        },
      ),
    );
  }
}
