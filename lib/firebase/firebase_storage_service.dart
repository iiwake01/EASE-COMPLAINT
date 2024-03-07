import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class FirebaseStorageService extends GetxService {
  
  final storageRef = FirebaseStorage.instance.ref();

  FirebaseStorageService() {

  }
}