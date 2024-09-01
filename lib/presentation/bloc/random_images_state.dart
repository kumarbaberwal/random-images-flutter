import 'package:randomimages/domain/entity/random_images_entity.dart';

abstract class RandomImagesState {}

class RandomImagesStateInitial extends RandomImagesState {}

class RandomImagesStateLoading extends RandomImagesState {}

class RandomImagesStateLoaded extends RandomImagesState {
  final List<RandomImagesEntity> randomImagesEntity;

  RandomImagesStateLoaded({required this.randomImagesEntity});

}

class RandomImagesStateFailure extends RandomImagesState {
  final String error;

  RandomImagesStateFailure({required this.error});
}
