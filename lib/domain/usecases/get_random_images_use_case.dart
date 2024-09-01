import 'package:randomimages/domain/entity/random_images_entity.dart';
import 'package:randomimages/domain/repository/random_images_repository.dart';

class GetRandomImagesUseCase {
  final RandomImagesRepository randomImagesRepository;

  GetRandomImagesUseCase({required this.randomImagesRepository});

  Future<List<RandomImagesEntity>> call(String query) async {
    return await randomImagesRepository.getRandomImages(query);
  }
}
