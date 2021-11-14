import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photo_detect_poc/auth.dart';
import 'package:photo_detect_poc/take_picture_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    try {
      await widget.auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 5,
              ),
              onPressed: () async {
                // Obtain a list of the available cameras on the device.
                final cameras = await availableCameras();
                // Get a specific camera from the list of available cameras.
                final firstCamera = cameras.first;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakePictureScreen(
                      camera: firstCamera,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Take a picture'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      'Streaming option is held up by provision from the back end',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Streaming camera'),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                primary: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
