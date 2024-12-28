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

    return Scaffold(
      appBar: AppBar(title: const Text('ISS Tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use `when` to handle loading, error, and data states
            issState.when(
              loading: () => _buildLoadingUI(),
              error: (error, stackTrace) => _buildErrorUI(error),
              data: (data) {
                // Check if the state is HomeStateInitial and treat it as loading
                if (data is HomeStateInitial) {
                  return _buildLoadingUI();
                }

                return _buildDataUI(data);
              },
            ),
            const SizedBox(height: 20),
            // Refresh button to manually fetch ISS data
            ElevatedButton(
              onPressed: issState.isLoading ||
                      issState.value is HomeStateInitial
                  ? null // Disable the button if loading
                  : () {
                      _logger.info('Manual refresh triggered');
                      ref.read(homeViewModelProvider.notifier).fetchIssInfo();
                    },
              child: const Text('Refresh Data'),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the loading UI.
  Widget _buildLoadingUI() {
    return const Column(
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 20),
        Text('Fetching ISS info. Please Wait...'),
      ],
    );
  }

  /// Builds the error UI.
  Widget _buildErrorUI(dynamic error) {
    return Column(
      children: [
        Text(
          'Error: $error',
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 20),
        const Text('Please try refreshing again.'),
      ],
    );
  }

  /// Builds the data UI.
  Widget _buildDataUI(HomeState data) {
    final issInfo = data.issInfo;
    return Column(
      children: [
        if (data.isInUserCountry)
          const Text('ISS is vurrently in your country!'),
        Text('Latitude: ${issInfo?.latitude}'),
        Text('Longitude: ${issInfo?.longitude}'),
        Text('Last Updated (UTC): ${issInfo?.utcTime}'),
        Text('Last Updated (Local): ${issInfo?.localTime}'),
        if (issInfo?.country != null) Text('Country: ${issInfo?.country}'),
        // Display countdown timer using Consumer to isolate updates
        Consumer(
          builder: (context, ref, child) {
            final countdown =
                ref.watch(homeViewModelProvider.notifier).countdown;
            return Text('Next update in: $countdown seconds');
          },
        ),
      ],
    );
  }
}
