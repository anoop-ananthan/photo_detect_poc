// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:photo_detect_poc/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
    required this.auth,
  }) : super(key: key);

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    double width = double.infinity;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'Warning: POC release, not to be deployed',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const ObjectivePoint(
              checked: true,
              text: 'Authentication using Google',
            ),
            const ObjectivePoint(
              checked: false,
              text: 'Take a photo',
            ),
            const ObjectivePoint(
              checked: false,
              text:
                  'Optimize the photo to be transported across slow network (800KB prefered)',
            ),
            const ObjectivePoint(
              checked: false,
              text:
                  'Encrypt the photo and store locally, update local database',
            ),
            const ObjectivePoint(
              checked: false,
              text:
                  'Upload to CLOUD, update local database if success else mark for later time',
            ),
            const ObjectivePoint(
              checked: false,
              text: 'Notify if there is change in data in CLOUD',
            ),
            const SizedBox(
              height: 50,
            ),
            const Icon(
              Icons.camera_alt,
              color: Colors.grey,
              size: 69,
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              width: width,
              color: Colors.green,
              radius: 50,
              text: 'Login using Google',
              onPressed: _signInWithGoogle,
            ),
            Button(
              width: width,
              color: Colors.blue.shade900,
              radius: 50,
              text: 'Login using Facebook',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.width,
    required this.color,
    required this.radius,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final Color color;
  final double radius;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class ObjectivePoint extends StatelessWidget {
  const ObjectivePoint({
    Key? key,
    required this.checked,
    required this.text,
  }) : super(key: key);

  final bool checked;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            checked
                ? const Icon(Icons.check_circle_outline)
                : const Icon(Icons.circle_outlined),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.grey.shade700),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
