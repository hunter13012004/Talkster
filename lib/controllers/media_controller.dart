// import 'dart:io';

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class MediaController extends GetxController {
//   final ImagePicker _imagePicker = ImagePicker();

//   Future<File?> pickImage() async {
//     XFile? pickedimage =
//         await _imagePicker.pickImage(source: ImageSource.camera);
//     if (pickedimage != null) {
//       return File(pickedimage.path);
//     } else {
//       return null;
//     }
//   }
// }
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MediaController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();

  // Using Rx to store the selected image

  Future<File?> pickpfp() async {
    XFile? _file = await _imagePicker.pickImage(source: ImageSource.camera);
    if (_file != null) {
      print(_file);
      return File(_file.path);
    } else {
      return null;
    }
  }
}
