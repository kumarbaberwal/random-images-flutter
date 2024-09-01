import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomimages/presentation/bloc/random_images_bloc.dart';
import 'package:randomimages/presentation/bloc/random_images_event.dart';
import 'package:randomimages/presentation/widgets/random_images.dart';

class RandomImagesPage extends StatelessWidget {
  final TextEditingController query = TextEditingController();
  RandomImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Random Images",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: query,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        prefixIcon: const Icon(Icons.search)),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton(
                  onPressed: () {
                    context.read<RandomImagesBloc>().add(
                          FetchRandomImagesEvent(
                            query: query.text.trim(),
                          ),
                        );
                  },
                  icon: const Icon(CupertinoIcons.search),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const RandomImages(),
          ],
        ),
      ),
    );
  }
}
