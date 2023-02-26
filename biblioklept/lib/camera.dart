import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({this.cameras, Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 400,
              width: 400,
              child: CameraPreview(controller),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              pictureFile = await controller.takePicture();
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color.fromARGB(255, 112, 4, 80),
                foregroundColor: Colors.white,
                fixedSize: const Size(120, 40)),
            child: const Icon(
              Icons.photo_camera,
              size: 30,
            ),
          ),
        ),
        if (pictureFile != null)
          Column(
            children: [
              Image.file(
                File(pictureFile!.path),
                height: 180,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color.fromARGB(255, 112, 4, 80),
                        foregroundColor: Colors.white,
                        fixedSize: const Size(120, 40)),
                    child: const Text(
                      'Save Image',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       pictureFile = null;
                  //     });
                  //   },
                  //   child: const Text('Take Another Picture'),
                  // ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
