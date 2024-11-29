import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

/*
! get it is a service locator or dependency injection
*/
final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(apiService: getIt.get<ApiService>()),
  );
}
