import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/services/storage_service.dart';

class AuthMethods {
  // create a firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // register new user
  Future<String> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List profilePic,
  }) async {
    String res = "An error occurred";
    try {
      if (userName.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          bio.isNotEmpty &&
          bio.isNotEmpty) {
        //create a new user
        final UserCredential userCredintial = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        //upload the profilePic to the storage
        String photoURL = await StorageMethods().uploadImage(
          folderName: "ProfileImages",
          isPost: false,
          file: profilePic,
        );

        UserModel user = UserModel(
          uid: _auth.currentUser!.uid,
          email: email,
          userName: userName,
          bio: bio,
          profilePic: photoURL,
          followers: [],
          following: [],
        );

        if (userCredintial.user != null) {
          await _firestore.collection('users').doc(_auth.currentUser!.uid).set(
                user.toJSON(),
              );

          res = "success";
        }
      }
    } catch (error) {
      // print(error.toString());
      res = error.toString();
    }

    return res;
  }
}
