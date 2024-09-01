import 'package:randomimages/data/models/random_images_model.dart';
import 'package:randomimages/data/sources/random_images_api.dart';
import 'package:randomimages/domain/entity/random_images_entity.dart';
import 'package:randomimages/domain/repository/random_images_repository.dart';

class RandomImagesRepositoryImpl extends RandomImagesRepository {
  final RandomImagesApi randomImagesApi;

  RandomImagesRepositoryImpl({required this.randomImagesApi});
  @override
  Future<List<RandomImagesEntity>> getRandomImages(String query) async {
    final images = await randomImagesApi.getRandomImages(query);
    return images.map((imageModel) => imageModel.toEntity()).toList();
  }
}
