import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class Storagecontroller extends GetxController {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadProfilePic(
      {required String uid, required File file}) async {
    Reference pfpref =
        _storage.ref('user/pfp').child('$uid${p.extension(file.path)}');

    UploadTask task = pfpref.putFile(file);
    return task.then((p) {
      if (p.state == TaskState.success) {
        print(task);
        return pfpref.getDownloadURL();
      } else {
        return null;
      }
    });
  }
}
