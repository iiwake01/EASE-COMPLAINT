import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class FirebaseStorageService extends GetxService {
  
  final storageRef = FirebaseStorage.instance.ref();

  Reference? imagesRef;

  FirebaseStorageService() {
    imagesRef = storageRef.child('images/');
  }

  Future<TaskSnapshot?> uploadPlatformFiles(PlatformFile? file) async {
    debugPrint("uploadPlatformFiles ${file?.name} ${file?.size}");
    if (file != null && file.name == null || file?.bytes == null) {
      throw Exception("File is Null");
    }
    bool isImage = file?.extension?.toLowerCase().contains("jpg") == true || file?.extension?.toLowerCase().contains("png") == true || file?.extension?.toLowerCase().contains("webp") == true;    
    if(isImage = true) {
      return await imagesRef?.child(file!.name).putData(file.bytes!);
    } else {
      return null;
    }
  }

  Future<void> deleteImage(String? icon) async {
    debugPrint("deleteImage $icon");
    if (icon == null) {
      throw Exception("Image is Null");
    }
    await imagesRef?.child(icon).delete();
  }
}