import 'package:airport_solution/models/entries.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class EntryProvider extends ChangeNotifier {
  // Variables

  String _fromMapAddress;
  String _toMapAddress;
  String _time;
  DateTime _date;
  String _passengers;
  String _luggages;
  String _vehicleName;
  String _vehicleImage;
  var uuid = Uuid();

  // Getter

  String get fromMapAddress => _fromMapAddress;
  String get toMapAddress => _toMapAddress;
  String get time => _time;
  DateTime get date => _date;
  String get passengers => _passengers;
  String get luggages => _luggages;
  String get vehicleName => _vehicleName;
  String get vehicleImage => _vehicleImage;

  // Setter

  set changeFromMapAddress(String fromMapAddress) {
    _fromMapAddress = fromMapAddress;
    notifyListeners();
  }

  set changeToMapAddress(String toMapAddress) {
    _toMapAddress = toMapAddress;
    notifyListeners();
  }

  set changeTime(String time) {
    _time = time;
    notifyListeners();
  }

  set changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  set changePassengers(String passengers) {
    _passengers = passengers;
    notifyListeners();
  }

  set changeLuggages(String luggages) {
    _luggages = luggages;
    notifyListeners();
  }

  set changeVehicleName(String vehicleName) {
    _vehicleName = vehicleName;
    notifyListeners();
  }

  set changeVehicleImage(String vehicleImage) {
    _vehicleImage = vehicleImage;
    notifyListeners();
  }

  // Functions

  // Load Values Function it will load all the values if the values aren't null

  loadAll(Entry entry) {
    if (entry != null) {
      _fromMapAddress = entry.fromMapAddress;
      _toMapAddress = entry.toMapAddress;
      _time = entry.time;
      _date = DateTime.parse(entry.date);
      _passengers = entry.passengers;
      _luggages = entry.luggages;
      _vehicleName = entry.vehicleName;
      _vehicleImage = entry.vehicleImage;
    } else {
      _fromMapAddress = null;
      _toMapAddress = null;
      _time = null;
      _date = DateTime.now();
      _passengers = null;
      _luggages = null;
      _vehicleName = null;
      _vehicleImage = null;
    }
  }
}
// This function will save the entry

//   saveEntry() {
//     if (_entryId == null) {
//       // Add then
//       var newEntry = Entry(
//         fromMapAddress: _fromMapAddress,
//         toMapAddress: _toMapAddress,
//         time: _time,
//         date: _date.toIso8601String(),
//         passengers: _passengers,
//         luggages: _luggages,
//         vehicleName: _vehicleName,
//         vehicleImage: _vehicleImage,
//         entryId: uuid.v1(),
//       );
//       firestoreSerevice.setEntry(newEntry);
//     } else {
//       var updatedEntry = Entry(
//         fromMapAddress: _fromMapAddress,
//         toMapAddress: _toMapAddress,
//         time: _time,
//         date: _date.toIso8601String(),
//         passengers: _passengers,
//         luggages: _luggages,
//         vehicleName: _vehicleName,
//         vehicleImage: _vehicleImage,
//         entryId: _entryId,
//       );
//       firestoreSerevice.setEntry(updatedEntry);
//     }
//   }

//   // This function will remove the entry

//   removeEntry(String entryId) {
//     firestoreSerevice.removeEntry(entryId);
//   }
// }
