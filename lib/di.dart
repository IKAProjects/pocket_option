import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pocket_collection/src/data/collection_repository.dart';
import 'package:pocket_collection/src/data/item_repository.dart';
import 'package:pocket_collection/src/data/achievement_repository.dart';
import 'src/domain/models/collection_model.dart';
import 'src/domain/models/item_model.dart';
import 'src/domain/models/achievement_model.dart';

final getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  await Hive.initFlutter();

  var collectionBox = await Hive.openBox<CollectionModel>('collectionsBox');
  getIt.registerSingleton<Box<CollectionModel>>(collectionBox);
  getIt.registerLazySingleton<CollectionRepository>(() => CollectionRepository(collectionBox));

  var itemBox = await Hive.openBox<ItemModel>('itemsBox');
  getIt.registerSingleton<Box<ItemModel>>(itemBox);
  getIt.registerLazySingleton<ItemRepository>(() => ItemRepository(itemBox));

  var achievementBox = await Hive.openBox<AchievementModel>('achievementsBox');
  getIt.registerSingleton<Box<AchievementModel>>(achievementBox);
  getIt.registerLazySingleton<AchievementRepository>(() => AchievementRepository(achievementBox));
}