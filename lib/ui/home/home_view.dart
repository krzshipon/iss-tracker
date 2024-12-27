import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iss_tracker_app/provider/providers.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: Implement the HomeView UI later
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home View!'),
            ElevatedButton(
                onPressed: () => ref.read(authRepositoryProvider).logout(),
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
