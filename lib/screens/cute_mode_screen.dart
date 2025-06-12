import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CuteModeScreen extends StatefulWidget {
  @override
  _CuteModeScreenState createState() => _CuteModeScreenState();
}

class _CuteModeScreenState extends State<CuteModeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/video_fofo.mp4')
      ..initialize().then((_) {
        setState(() {});  // Atualiza o estado quando o vídeo estiver pronto
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modo Fofo')),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(_controller),
              _PlayPauseOverlay(controller: _controller),
              VideoProgressIndicator(_controller, allowScrubbing: true),
            ],
          ),
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      child: Center(
        child: controller.value.isPlaying
            ? const SizedBox.shrink()
            : Container(
          color: Colors.black54,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}

