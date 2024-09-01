import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomimages/data/repository/random_images_repository_impl.dart';
import 'package:randomimages/data/sources/random_images_api.dart';
import 'package:randomimages/domain/usecases/get_random_images_use_case.dart';
import 'package:randomimages/presentation/bloc/random_images_bloc.dart';
import 'package:randomimages/presentation/pages/random_images_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomImagesBloc(
        GetRandomImagesUseCase(
          randomImagesRepository: RandomImagesRepositoryImpl(
            randomImagesApi: RandomImageApiImpl(),
          ),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RandomImagesPage(),
      ),
    );
  }
}
