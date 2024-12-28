import 'dart:async';

import 'package:iss_tracker_app/domain/model/home/iss_info.dart';
import 'package:iss_tracker_app/provider/providers.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

sealed class HomeState {
  final IssInfo? issInfo;
  final bool isInUserCountry;
  const HomeState({this.issInfo, this.isInUserCountry = false});
}

class HomeStateInitial extends HomeState {
  const HomeStateInitial();
}

class HomeStateNewIssData extends HomeState {
  const HomeStateNewIssData({required super.issInfo, super.isInUserCountry});
}

/// ViewModel for the Home screen
@riverpod
class HomeViewModel extends _$HomeViewModel {
  final _logger = Logger('HomeViewModel');
  Timer? _autoRefreshTimer;
  int _countdown = 60;

  /// Returns the current countdown value for the next refresh.
  int get countdown => _countdown;

  @override
  Future<HomeState> build() async {
    _logger.info('Initializing HomeViewModel');

    initialize();

    // Clean up resources when the provider is disposed
    ref.onDispose(() {
      _logger.info('Disposing HomeViewModel resources');
      _autoRefreshTimer?.cancel();
    });

    // Return a default IssInfo object if state.value is null
    return const HomeStateInitial();
  }

  /// Initializes the ViewModel by fetching data and starting the auto-refresh timer.
  Future<void> initialize() async {
    await fetchIssInfo();
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
      if (issInfo.country != null) {
        _checkUserCountryWittIssLocation(issInfo.country!);
      }
      _startAutoRefresh();
      state = AsyncData(HomeStateNewIssData(
        issInfo: issInfo,
      ));
      _resetCountdown();
    } catch (e, s) {
      _logger.severe('Failed to fetch ISS info $e', e, s);
      state = AsyncError('Failed to obtain iss info!', s);
    }
  }

  Future<void> _checkUserCountryWittIssLocation(String issCountry) async {
    try {
      final userCurrentCountry =
          await ref.read(issInfoRepositoryProvider).getUserCountry();
      _logger.info('User\'s current country: $userCurrentCountry');
      final isIssInUserCountry = issCountry == userCurrentCountry;
      if (state.value is HomeStateNewIssData) {
        state = AsyncData(HomeStateNewIssData(
          issInfo: state.value?.issInfo,
          isInUserCountry: isIssInUserCountry,
        ));
      }
    } catch (e) {
      _logger.severe('Failed to check user\'s country $e');
    }
  }

  /// Resets the countdown timer to 60 seconds.
  void _resetCountdown() {
    _logger.info('Resetting countdown to 60 seconds');

    _countdown = 60;
    ref.notifyListeners(); // Notify listeners when the countdown is reset
  }

  /// Signs out the user.
  Future<bool> signOut() async {
    _logger.info('Signing out user...');
    try {
      // Call the signOut method from the AuthViewModel
      await ref.read(authRepositoryProvider).logout();
      _logger.info('User signed out successfully.');
      return true;
    } catch (e) {
      _logger.severe('Failed to sign out: $e');
      return false;
    }
  }
}
