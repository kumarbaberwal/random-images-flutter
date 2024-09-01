// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomimages/domain/usecases/get_random_images_use_case.dart';
import 'package:randomimages/presentation/bloc/random_images_event.dart';
import 'package:randomimages/presentation/bloc/random_images_state.dart';

class RandomImagesBloc extends Bloc<RandomImagesEvent, RandomImagesState> {
  final GetRandomImagesUseCase getRandomImagesUseCase;
  RandomImagesBloc(
    this.getRandomImagesUseCase,
  ) : super(RandomImagesStateInitial()) {
    on<FetchRandomImagesEvent>(
      (event, emit) async {
        emit(RandomImagesStateLoading());
        try {
          final randomImagesEntity = await getRandomImagesUseCase(event.query);
          emit(RandomImagesStateLoaded(randomImagesEntity: randomImagesEntity));
        } catch (e) {
          emit(RandomImagesStateFailure(error: e.toString()));
        }
      },
    );
  }
}
