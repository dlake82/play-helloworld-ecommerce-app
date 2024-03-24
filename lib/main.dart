// ignore_for_file: depend_on_referenced_packages

import 'package:secondhand_market/app/app.dart';
import 'package:secondhand_market/app/shared/data/models/authors_response.dart';
import 'package:secondhand_market/app/shared/data/models/posts_response.dart';
import 'package:secondhand_market/core/di.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final dbPath = join(dir.path, '.db.post');
  await Hive.initFlutter(dbPath);

  // register custom types
  Hive
    ..registerAdapter(PostsResponseAdapter())
    ..registerAdapter(PostAdapter())
    ..registerAdapter(AuthorAdapter())
    ..registerAdapter(AuthorsResponseAdapter());

  await setup();

  runApp(const App());
}
