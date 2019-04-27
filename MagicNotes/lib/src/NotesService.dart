import 'dart:async';
import 'dart:convert';
import 'package:MagicNotes/src/Note.dart';
import 'package:http/http.dart';

/* 
To rename this module and change the dependency imports of other modules.
 */

// Mock notes and the service will be deleted once actual service is completed
class NotesService {
  final List<Note> notes = [
    Note.basic(1),
    Note.basic(2),
    Note.basic(3),
    Note.basic(4),
    Note.basic(5),
  ];

   Future<List<Note>> getAll() async => notes;

  // Future<Note> get(int id) async =>
  //     (await getAll()).firstWhere((note) => note.id == id);
  Note get(int id) => notes.firstWhere((note) => note.id == id);
}

/* class NotesService {
  /// API endpoint to get the Notes
  static const _notesUrl = 'api/notes';
  final Client _http;

  /// List of Notes
  static List<Note> notes = [];

  // HTTP package received with dependency injection
  NotesService(this._http);

  Future<List<Note>> getAll() async {
    if (notes.isEmpty)
      try {
        final response = await _http.get(_notesUrl);

        // final notes = (_extractData(response) as List)

        // Extract notes from response and save into the list of NotesService class
        notes = (_extractData(response) as List)
            .map((json) => Note.fromJson(json))
            // .map(Note.fromJson) // Directly pass the function to execute
            .toList();

        return notes;
      } catch (e) {
        throw _handleError(e);
      }
    else
      return notes;
  }

  // get() by id method based on calling get all and filtering result
  // Future<Note> get(int id) async =>
  //     (await getAll()).firstWhere((Note) => Note.id == id);

  Future<Note> get(int id) async {
    // Method 1 gets the individual Note data from the server directly
    final response = await _http.get('$_notesUrl/$id');
    return Note.fromJson(_extractData(response));

    // Below method 2 gets the Note from the list in memory
    // if (notes.isNotEmpty) return notes.firstWhere((Note) => Note.id == id);
  }


  dynamic _extractData(Response res) => json.decode(res.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
} */
