import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagesDao {
  static final FirebaseStorage storage = FirebaseStorage.instance;

  static Future<List<String>> uploadImages(List<Asset> images) async {
    List<String> uploadedList = [];
    User user = FirebaseAuth.instance.currentUser;
    await Future.forEach(images, (image) async {
      ByteData byteData = await image.getByteData(quality: 50);
      List<int> imageData = byteData.buffer.asUint8List();
      UploadTask task = storage
          .ref()
          .child('images')
          .child(user.uid)
          .child(image.name + ".jpg")
          .putData(imageData);
      TaskSnapshot taskSnapshot = await Future.value(task);
      uploadedList.add(taskSnapshot.metadata.fullPath);
    });

    return uploadedList;
  }

  static image(String path) {
    return storage.ref(path).getDownloadURL();
  }
}
