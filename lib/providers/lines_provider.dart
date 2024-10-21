

import 'package:flutter_riverpod_starting_project/repository/lines_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// AsyncNotifier Provider for Posts
final linesNotifierProvider = AsyncNotifierProvider<LinesNotifier, dynamic>(() {
  return LinesNotifier();
});

class LinesNotifier extends AsyncNotifier<dynamic>{
  late final LinesRepo _repository;

  @override
  FutureOr build() async {
    _repository = ref.read(linesRepoProvider); // Dependency injection
    return await _repository.fetchLines();
  }
}