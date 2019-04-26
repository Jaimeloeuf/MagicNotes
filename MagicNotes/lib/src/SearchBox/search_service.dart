/* 

  Search service searches through the local in memory index first.

 */

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:angular/angular.dart';

class SearchService {
  void search(String term) {
    
  }
}

// Should Search service be build on the existing NotesService
// class HeroService {
//   // get() by id method based on calling get all and filtering result
//   // Future<Hero> get(int id) async =>
//   //     (await getAll()).firstWhere((hero) => hero.id == id);

//   Future<Hero> get(int id) async {
//     // Method 1 gets the individual hero data from the server directly
//     final response = await _http.get('$_heroesUrl/$id');
//     return Hero.fromJson(_extractData(response));

//     // Below method 2 gets the hero from the list in memory
//     // if (heroes.isNotEmpty) return heroes.firstWhere((hero) => hero.id == id);
//   }

//   static const _searchUrl = 'api/search'; // URL to web API

//   final Client _http;

//   static List<Note> notes = [];

//   // This is the part where the http package is needed in the main.dart package for injection
//   HeroService(this._http);

//   Future<List<Hero>> getAll() async {
//     if (heroes.isEmpty)
//       try {
//         final response = await _http.get(_heroesUrl);

//         // final heroes = (_extractData(response) as List)
//         heroes = (_extractData(response) as List)
//             .map((json) => Hero.fromJson(json))
//             .toList();

//         return heroes;
//       } catch (e) {
//         throw _handleError(e);
//       }
//     else
//       return heroes;
//   }

//   dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

//   Exception _handleError(dynamic e) {
//     print(e); // for demo purposes only
//     return Exception('Server error; cause: $e');
//   }
// }