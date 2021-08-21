// import 'package:airport_solution/services/placesService.dart';
// import 'package:flutter/widgets.dart';
// import 'package:geolocator/geolocator.dart';

// class ApplicationProvider with ChangeNotifier {
//   //Instances
//   final geolocatorService = GeolocatorService();
//   final placeSerchService = PlaceSearchService();

//   //variables
//   Position currentLocation;
//   List<PlaceSearch> searchResults;

//   //Constuctor
//   ApplicationProvider() {
//     setCurrentLocation();
//   }

//   setCurrentLocation() async {
//     currentLocation = await geolocatorService.getCurrentLocation();
//     notifyListeners();
//   }

//   searchPlaces(String searchText) async {
//     searchResults = await placeSerchService.getAutoComplete(searchText);
//     notifyListeners();
//   }
// }
