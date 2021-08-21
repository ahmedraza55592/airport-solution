// import 'package:airport_solution/models/entries.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FiresstoreService {
//   FirebaseFirestore _db = FirebaseFirestore.instance;

//   //Get or Read the data from the cloud firestore

//   Stream<List<Entry>> getEntries() {
//     return _db.collection('entries').snapshots().map((snapshot) =>
//         snapshot.docs.map((doc) => Entry.fromJson(doc.data())).toList());
//   }

//   // Create the Data into the cloud firestore and Update the data into the cloud firestore

//   Future<void> setEntry(Entry entry) {
//     var options = SetOptions(merge: true);

//     return _db
//         .collection('entries')
//         .doc(entry.entryId)
//         .set(entry.toMap(), options);
//   }

//   // Delete the data from the cloud firestore

//   Future<void> removeEntry(String entryId) {
//     return _db.collection('entries').doc(entryId).delete();
//   }
// }
