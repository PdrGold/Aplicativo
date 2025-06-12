import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SpecialMomentsScreen extends StatefulWidget {
  @override
  _SpecialMomentsScreenState createState() => _SpecialMomentsScreenState();
}

class _SpecialMomentsScreenState extends State<SpecialMomentsScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Momentos Especiais')),
      body: Column(
        children: [
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Adicionar foto da galeria'),
          ),
          SizedBox(height: 16),
          Expanded(
            child: _images.isEmpty
                ? Center(child: Text('Nenhuma foto adicionada ainda.'))
                : GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Image.file(_images[index], fit: BoxFit.cover);
              },
            ),
          ),
        ],
      ),
    );
  }
}

