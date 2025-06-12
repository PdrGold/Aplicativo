import 'package:flutter/material.dart';
import 'days_counter_screen.dart';
import 'love_letters_screen.dart';
import 'photo_gallery_screen.dart';
import 'special_moments_screen.dart';
import 'reminders_screen.dart';
import 'playlist_screen.dart';
import 'cute_mode_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'title': 'Tempo Juntos', 'screen': TempoJuntosScreen()},
    {'title': 'Cartas de Amor', 'screen': LoveLettersScreen()},
    {'title': 'Galeria de Fotos', 'screen': PhotoGalleryScreen()},
    {'title': 'Momentos Especiais', 'screen': SpecialMomentsScreen()},
    {'title': 'Lembretes', 'screen': RemindersScreen()},
    {'title': 'Nossa Música', 'screen': NossaMusicaScreen()},
    {'title': 'Modo Fofo', 'screen': CuteModeScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amor')),
      body: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(features[index]['title']),
            trailing: Icon(Icons.favorite, color: Colors.pinkAccent),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => features[index]['screen']),
              );
            },
          );
        },
      ),
    );
  }
}
