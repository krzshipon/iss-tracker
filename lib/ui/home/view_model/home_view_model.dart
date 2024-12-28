import 'dart:async';

import 'package:iss_tracker_app/domain/model/home/iss_info.dart';
import 'package:iss_tracker_app/provider/providers.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

/// ViewModel for the Home screen
@riverpod
class HomeViewModel extends _$HomeViewModel {
  final _logger = Logger('HomeViewModel');
  Timer? _autoRefreshTimer;
  int _countdown = 60;

  /// Returns the current countdown value for the next refresh.
  int get countdown => _countdown;

  @override
  Future<IssInfo> build() async {
    _logger.info('Initializing HomeViewModel');

    initialize();

    // Clean up resources when the provider is disposed
    ref.onDispose(() {
      _logger.info('Disposing HomeViewModel resources');
      _autoRefreshTimer?.cancel();
    });

    // Return a default IssInfo object if state.value is null
    return state.value ??
        const IssInfo(latitude: -1, longitude: -1, timestamp: 0);
  }

  /// Initializes the ViewModel by fetching data and starting the auto-refresh timer.
  Future<void> initialize() async {
    await fetchIssInfo();
    _startAutoRefresh();
  }

  /// Starts a timer to auto-refresh the ISS data every minute.
  void _startAutoRefresh() {
    _logger.info('Starting auto-refresh timer');

    _autoRefreshTimer?.cancel();
    _autoRefreshTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_countdown > 0) {
        _countdown--;
        _logger.fine('Countdown: $_countdown seconds');
        ref.notifyListeners(); // Notify listeners when the countdown changes
      } else {
        _countdown = 60;
        _logger.info('Auto-refresh triggered');
        fetchIssInfo();
      }
    });
  }

  /// Fetches the latest ISS location data from the repository.
  Future<void> fetchIssInfo() async {
    _logger.info('Fetching ISS location data');

    state = const AsyncLoading();
    try {
      final issInfo = await ref.read(issInfoRepositoryProvider).getIssInfo();
      _logger.info('Successfully fetched ISS info: $issInfo');
      state = AsyncData(issInfo);
      _resetCountdown();
    } catch (e, s) {
      _logger.severe('Failed to fetch ISS info', e, s);
      state = AsyncError(e, s);
    }
  }

  /// Resets the countdown timer to 60 seconds.
  void _resetCountdown() {
    _logger.info('Resetting countdown to 60 seconds');

    _countdown = 60;
    ref.notifyListeners(); // Notify listeners when the countdown is reset
  }
}
