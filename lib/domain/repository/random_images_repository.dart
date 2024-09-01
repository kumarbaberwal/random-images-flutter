import 'package:randomimages/domain/entity/random_images_entity.dart';

abstract class RandomImagesRepository {
  Future<List<RandomImagesEntity>> getRandomImages(String query);
}
