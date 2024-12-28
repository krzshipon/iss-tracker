import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iss_tracker_app/config/asset_config.dart';
import 'package:iss_tracker_app/ui/home/view_model/home_view_model.dart';
import 'package:logging/logging.dart';
import 'package:lottie/lottie.dart';

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie animation view
                _buildLottieAnimationView(context),
                // Title below the animation
                Text(
                  'ISS Tracker',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Use `when` to handle loading, error, and data states
                issState.when(
                  loading: () => _buildLoadingUI(context),
                  error: (error, stackTrace) => _buildErrorUI(error, context),
                  data: (data) {
                    // Check if the state is HomeStateInitial and treat it as loading
                    if (data is HomeStateInitial) {
                      return _buildLoadingUI(context);
                    }
                    return _buildDataUI(data, context);
                  },
                ),
                const SizedBox(height: 20),
                // Refresh button to manually fetch ISS data
                ElevatedButton(
                  onPressed:
                      issState.isLoading || issState.value is HomeStateInitial
                          ? null // Disable the button if loading
                          : () {
                              _logger.info('Manual refresh triggered');
                              ref
                                  .read(homeViewModelProvider.notifier)
                                  .fetchIssInfo();
                            },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    foregroundColor: Theme.of(context).colorScheme.onSurface,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Refresh Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the Lottie animation view.
  Widget _buildLottieAnimationView(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Lottie.asset(
        AssetConfig.homeIssAnimation,
        fit: BoxFit.contain,
      ),
    );
  }

  /// Builds the loading UI.
  Widget _buildLoadingUI(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(color: Theme.of(context).colorScheme.surface),
        const SizedBox(height: 20),
        Text(
          'Fetching ISS info. Please Wait...',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  /// Builds the error UI.
  Widget _buildErrorUI(dynamic error, BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.surface,
          size: 48,
        ),
        const SizedBox(height: 16),
        Text(
          'Error: $error',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Please try refreshing again.',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  /// Builds the data UI.
  Widget _buildDataUI(HomeState data, BuildContext context) {
    final issInfo = data.issInfo;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (data.isInUserCountry)
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'ISS is currently in your country!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            _buildInfoRow(
                'Latitude', issInfo?.latitude?.toString() ?? 'N/A', context),
            _buildInfoRow(
                'Longitude', issInfo?.longitude?.toString() ?? 'N/A', context),
            _buildInfoRow(
                'Last Updated (UTC)', issInfo?.utcTime ?? 'N/A', context),
            _buildInfoRow(
                'Last Updated (Local)', issInfo?.localTime ?? 'N/A', context),
            if (issInfo?.country != null)
              _buildInfoRow('Country', issInfo!.country!, context),
            const SizedBox(height: 16),
            // Display countdown timer using Consumer to isolate updates
            Consumer(
              builder: (context, ref, child) {
                final countdown =
                    ref.watch(homeViewModelProvider.notifier).countdown;
                return _buildInfoRow(
                    'Next update in', '$countdown seconds', context);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a row for displaying ISS information.
  Widget _buildInfoRow(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
