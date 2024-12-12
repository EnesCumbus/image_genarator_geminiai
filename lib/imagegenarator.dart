import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ImageGeneratorApp());
}

class ImageGeneratorApp extends StatelessWidget {
  const ImageGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Generator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const ImageGenerationScreen(),
    );
  }
}

class ImageGenerationScreen extends StatefulWidget {
  const ImageGenerationScreen({super.key});

  @override
  _ImageGenerationScreenState createState() => _ImageGenerationScreenState();
}

class _ImageGenerationScreenState extends State<ImageGenerationScreen> {
  final TextEditingController _promptController = TextEditingController();
  Uint8List? _imageBytes;
  bool _loading = false;
  final String apiKey =
      ''; // Buraya Hugging Face API anahtarınızı girin

  Future<void> _generateImage(String prompt) async {
    setState(() => _loading = true);

    try {
      final response = await http.post(
        Uri.parse(
            "https://api-inference.huggingface.co/models/CompVis/stable-diffusion-v1-4"),
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"inputs": prompt}),
      );

      if (response.statusCode == 200) {
        final Uint8List imageBytes = response.bodyBytes;

        setState(() {
          _imageBytes = imageBytes;
          _loading = false;
        });
      } else {
        throw Exception("Failed to generate image: ${response.reasonPhrase}");
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: Text("Failed to generate image: $e"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Generate Image from Prompt")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _promptController,
              decoration: const InputDecoration(
                labelText: 'Enter a prompt for image generation',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading
                  ? null
                  : () => _generateImage(_promptController.text),
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text("Generate Image"),
            ),
            const SizedBox(height: 20),
            if (_imageBytes != null)
              Image.memory(
                _imageBytes!,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
