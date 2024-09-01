abstract class RandomImagesEvent {}

class FetchRandomImagesEvent extends RandomImagesEvent {
  final String query;

  FetchRandomImagesEvent({required this.query});
}
