import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:randomimages/data/models/random_images_model.dart';

class RandomImageApiImpl extends RandomImagesApi {
  @override
  Future<List<RandomImagesModel>> getRandomImages(String query) async {
    String baseUrl =
        "https://api.unsplash.com/photos/random?count=100&client_id=-S3dFlgrB6_CEWtX1MKkq9oQMRXVYtgMTvY-ceBpblA&query=$query&orientation=landscape&fit=crop&w=500&h=500";
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => RandomImagesModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to Load Images");
    }
  }
}

abstract class RandomImagesApi {
  Future<List<RandomImagesModel>> getRandomImages(String query);
}
