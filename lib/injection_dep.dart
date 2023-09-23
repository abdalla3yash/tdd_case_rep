import 'package:poster/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:poster/features/posts/domain/usecases/add_post_usecase.dart';
import 'package:poster/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:poster/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:poster/features/posts/domain/usecases/update_post_usecase.dart';
import 'core/network/network_info.dart';
import 'features/posts/data/datasources/post_local_data_source.dart';
import 'features/posts/data/datasources/post_remote_data_source.dart';
import 'features/posts/domain/repositories/posts_repository.dart';
import 'features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => PostsBloc(getAllPostsUsecase: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), updatePost: sl(), deletePost: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));

// Repository

  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
