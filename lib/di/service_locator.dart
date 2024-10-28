
import '../repositories/PostRepository.dart';
import '../view_models/PostViewModel.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<PostRepository>(() => PostRepository(client: getIt<http.Client>()));
  getIt.registerFactory<PostViewModel>(() => PostViewModel(postRepository: getIt<PostRepository>()));
}