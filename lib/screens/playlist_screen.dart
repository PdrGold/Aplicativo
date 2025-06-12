import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class NossaMusicaScreen extends StatefulWidget {
  @override
  _NossaMusicaScreenState createState() => _NossaMusicaScreenState();
}

class _NossaMusicaScreenState extends State<NossaMusicaScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Toca a música automaticamente ao entrar na tela
    _audioPlayer.play(AssetSource('audio/nossa_musica.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Para o player e libera recursos
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nossa Música'),
      ),
      body: Center(
        child: Text(
          'Tocando nossa música... 🎵',
          style: TextStyle(fontSize: 24, color: Colors.pinkAccent),
        ),
      ),
    );
  }
}
