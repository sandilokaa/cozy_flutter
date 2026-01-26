import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/space.dart';

class SpaceService {
  static const _baseUrl = 'https://bwa-cozy-api-i9vx.vercel.app';

  Future<List<Space>> fetchRecommendedSpaces() async {
    final response = await http.get(Uri.parse('$_baseUrl/recommended-spaces'));

    if (response.statusCode != 200) {
      throw 'Gagal mengambil data space';
    }

    final List data = jsonDecode(response.body);
    return data.map((e) => Space.fromJson(e)).toList();
  }
}
