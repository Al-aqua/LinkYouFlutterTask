import 'package:linkyou_flutter_task/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
Future<List<dynamic>> users(UsersRef ref) async {
  return await Api().fetchUsers();
}
