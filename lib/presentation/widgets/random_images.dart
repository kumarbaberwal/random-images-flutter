import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomimages/domain/entity/random_images_entity.dart';
import 'package:randomimages/presentation/bloc/random_images_bloc.dart';
import 'package:randomimages/presentation/bloc/random_images_state.dart';

class RandomImages extends StatelessWidget {
  const RandomImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomImagesBloc, RandomImagesState>(
      builder: (context, state) {
        if (state is RandomImagesStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RandomImagesStateLoaded) {
          final List<RandomImagesEntity> images = state.randomImagesEntity;
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                final imageUrl = images[index].urls.regular;
                return Card(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
              },
            ),
          );
        } else if (state is RandomImagesStateFailure) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        return Container();
      },
    );
  }
}
