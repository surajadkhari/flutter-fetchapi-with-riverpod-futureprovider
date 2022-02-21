import 'package:api_future/model/user_model.dart';
import 'package:api_future/services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.read(apiProvider).getUser();
});
