import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

abstract class ImageOptimizer {
  static Future<File> compressFile(File file) async {
    final filePath = file.absolute.path;

    // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 5,
    );

    // print(file.lengthSync());
    // print(result!.lengthSync());

    return result!;
  }
}
