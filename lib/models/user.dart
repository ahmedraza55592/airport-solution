class Users {
  final String userId;
  final String email;
  final String phoneNo;
  final String userName;

  Users({this.userId, this.email, this.phoneNo, this.userName});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'phoneNo': phoneNo,
      'userName': userName,
    };
  }

  Users.fromFirestore(Map<String, dynamic> firestore)
      : userId = firestore['userId'],
        email = firestore['email'],
        phoneNo = firestore['phoneNo'],
        userName = firestore['userName'];
}
