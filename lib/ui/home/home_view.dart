import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iss_tracker_app/ui/home/view_model/home_view_model.dart';
import 'package:logging/logging.dart';

/// Home screen widget that displays the current location of the International Space Station (ISS).
class HomeView extends ConsumerWidget {
  // Logger for the HomeView
  final _logger = Logger('HomeView');
  HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _logger.info('Building HomeView');

    // Watch the ISS data state from the HomeViewModel
    final issState = ref.watch(homeViewModelProvider);
    final issInfo = issState.value;

    return Scaffold(
      appBar: AppBar(title: const Text('ISS Tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display ISS data if available and not in loading state
            if (issInfo != null &&
                !issState.isLoading &&
                issInfo.latitude != -1) ...[
              Text('Latitude: ${issInfo.latitude}'),
              Text('Longitude: ${issInfo.longitude}'),
              Text('Last Updated (UTC): ${issInfo.utcTime}'),
              Text('Last Updated (Local): ${issInfo.localTime}'),
              if (issInfo.country != null) Text('Country: ${issInfo.country}'),
              // Display countdown timer using Consumer to isolate updates
              Consumer(
                builder: (context, ref, child) {
                  final countdown =
                      ref.watch(homeViewModelProvider.notifier).countdown;
                  _logger.fine('Countdown: $countdown seconds');
                  return Text('Next update in: $countdown seconds');
                },
              ),
              const SizedBox(height: 20),
              // Refresh button to manually fetch ISS data
              ElevatedButton(
                onPressed: () {
                  _logger.info('Manual refresh triggered');
                  ref.read(homeViewModelProvider.notifier).fetchIssInfo();
                },
                child: const Text('Refresh Data'),
              ),
            ] else ...[
              // Show a loader while data is loading
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              const Text('Fetching ISS info. Please Wait...'),
            ],
          ],
        ),
      ),
    );
  }
}
