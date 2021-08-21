import 'package:airport_solution/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreUserService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  User userinfo = FirebaseAuth.instance.currentUser;

  Future<void> addUser(Users user) {
    return _db.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<Users> fetchUser(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .get()
        .then((snapshot) => Users.fromFirestore(snapshot.data()));
  }

  Future<void> fetchUserInfo() {
    return _db.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  // Future<Users> getUserName(Users user) async {
  //   return _db
  //       .collection('users')
  //       .doc(user.)
  //       .get()
  //       .then((snapshot) => Users.fromFirestore(snapshot.data()));
  // }

  Stream<List<Users>> getEntries(String userId) {
    return _db.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Users.fromFirestore(doc.data())).toList());
  }
}
