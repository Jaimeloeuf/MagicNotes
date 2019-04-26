import 'dart:async';
import 'dart:convert';
import 'package:MagicNotes/src/Note.dart';
import 'package:http/http.dart';

// Finnish up the Notes definition library package and import it here.

class TextNoteService {
  static const _heroesUrl = 'api/heroes'; // URL to web API
  final Client _http;

  /// Get the http service through dependency injection
  TextNoteService(this._http);

  Future<List<Note>> getAll() async {
    try {
      final response = await _http.get(_heroesUrl);
      final TextNotes = (_extractData(response) as List)
          .map((json) => Note.fromJson(
              json)) // To implement a json to TextNote object method in the class
          .toList();

      return TextNotes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Search through all notes in memory. firstWhere is used as [note.id] is unique
  Future<Note> get(int id) async =>
      (await getAll()).firstWhere((note) => note.id == id);

  Future<Note> delete(int id) async =>
      (await getAll()).firstWhere((note) => note.id == id);

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
}
