import 'package:flutter/material.dart';
import 'dart:async';

class TempoJuntosScreen extends StatefulWidget {
  @override
  _TempoJuntosScreenState createState() => _TempoJuntosScreenState();
}

class _TempoJuntosScreenState extends State<TempoJuntosScreen> {
  final DateTime startDate = DateTime(2025, 1, 23, 0, 0);
  late Timer _timer;
  late Duration _difference;

  @override
  void initState() {
    super.initState();
    _difference = DateTime.now().difference(startDate);
    _timer = Timer.periodic(Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      _difference = DateTime.now().difference(startDate);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalDays = _difference.inDays;
    final months = totalDays ~/ 30;
    final days = totalDays % 30;
    final hours = _difference.inHours % 24;
    final minutes = _difference.inMinutes % 60;
    final seconds = _difference.inSeconds % 60;

    return Scaffold(
      appBar: AppBar(
        title: Text('💞 Tempo Juntos 💞'),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🌸 Estamos juntinhos há... 🌸',
              style: TextStyle(
                fontSize: 24,
                color: Colors.purple,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30),
            Text(
              '💕 $months meses e $days dias 💕',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '⏳ $hours h : $minutes min : $seconds s ⏳',
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink[700],
              ),
            ),
            SizedBox(height: 30),
            Icon(Icons.favorite, color: Colors.red, size: 60),
          ],
        ),
      ),
    );
  }
}
