import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  //create a storage instance
  final FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  // function for store the pictures to the storage and return the URL
  Future<String> uploadImage({
    required String folderName,
    required bool isPost,
    required Uint8List file,
  }) async {
    // try{

    // create a reference for the image here we also select the correct folder
    Reference ref =
        _storage.ref().child(folderName).child(_auth.currentUser!.uid);

    //if this is a post add another id
    if (isPost) {
      String postId = const Uuid().v4();
      ref = ref.child(postId);
    }
    //post id >> posts >> postId >> 121 1212 121 121

    //upload the image to the storage
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();

    return downloadURL;

    // }catch(error){
    //   print(error.toString());
    // }
  }
}
