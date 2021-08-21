// import 'package:airport_solution/models/placeSearch.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class PlaceSearchService {
//   final key = "API-Key";

//   Future<List<PlaceSearch>> getAutoComplete(String search) async {
//     var myUrl = Uri.parse(
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=geocode&key=$key');

//     var response = await http.get(myUrl);
//     var json = convert.jsonDecode(response.body);
//     var jsonResults = json['predictions'] as List;
//     return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
//   }
// }
