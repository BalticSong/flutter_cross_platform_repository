// api_service.dart
import 'dart:convert';
import 'package:flutter_android_ios/data/remote/model/entry_model.dart';
import 'package:http/http.dart' as http;

class ItunesAPIService {
  Future<List<EntryModel>> fetchSongs(int limit) async {
    final response = await http.get(Uri.parse(
        'https://itunes.apple.com/us/rss/topsongs/limit=$limit/json'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final entries = jsonData['feed']['entry'] as List;
        return entries.map((entry) => EntryModel.fromJson(entry)).toList();
      } else {
        throw Exception('Failed to login');
      }
    }

}
