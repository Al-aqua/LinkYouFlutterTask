import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkyou_flutter_task/provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<dynamic>> users = ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinkYou Flutter Task'),
        centerTitle: true,
      ),
      body: switch (users) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final user = value[index];
              return ListTile(
                title: Text(user['first_name'] + ' ' + user['last_name']),
              );
            },
          ),
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => Container(),
      },
    );
  }
}
