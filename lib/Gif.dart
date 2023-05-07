import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';

class Gif extends StatelessWidget {
  const Gif({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Giphy Picker Demo',
      home: MyHomePage(title: 'Giphy Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GiphyGif? _gif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gif?.title ?? 'Giphy Picker Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: _gif == null
              ? const Text('Pick a gif..')
              : GiphyImage.original(
                  placeholder: Container(
                    height: 50,
                    width: 50,
                  ),
                  gif: _gif!),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          // request your Giphy API key at https://developers.giphy.com/
          final gif = await GiphyPicker.pickGif(
            context: context,
            // YOUR GIPHY APIKEY HERE
            apiKey: 'egp31z7xt2cvcI8ZRjlK8UQd14QDuNIe',
          );

          if (gif != null) {
            setState(() => _gif = gif);
          }
        },
      ),
    );
  }
}