import 'dart:convert';
import 'dart:io';

import 'package:learnbloc/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchItem() async {
    try {
      final resp = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );
      if (resp.statusCode == 200) {
        final body = jsonDecode(resp.body.toString()) as List;
        return body.map((e) {
          return PostModel(
            id: e['id'],
            name: e['name'],
            email: e['email'],
            body: e['body'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('No Internet connection');
    }
    throw Exception('Unable to fetch data');
  }
}
