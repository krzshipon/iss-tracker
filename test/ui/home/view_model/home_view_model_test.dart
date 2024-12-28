import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iss_tracker_app/data/repository/auth/auth_repository.dart';
import 'package:iss_tracker_app/data/repository/iss_info/iss_info_repository.dart';
import 'package:iss_tracker_app/domain/model/home/iss_info.dart';
import 'package:iss_tracker_app/ui/home/view_model/home_view_model.dart';
import 'package:iss_tracker_app/provider/providers.dart';

// Fake IssInfoRepository
class FakeIssInfoRepository implements IssInfoRepository {
  @override
  Future<IssInfo> getIssInfo() async {
    return IssInfo(
      latitude: 0.0,
      longitude: 0.0,
      timestamp: 1696156800,
      country: 'Test Country',
    );
  }

  @override
  Future<String?> getUserCountry() async {
    return 'User Country';
  }
}

// Fake AuthRepository
class FakeAuthRepository implements AuthRepository {
  @override
  Future<bool> logout() async {
    return true;
  }

  @override
  Future<bool> get isAuthenticated => throw UnimplementedError();

  @override
  Future<bool> signInAnonymously() {
    throw UnimplementedError();
  }
}

// Subclass of FakeAuthRepository to override logout behavior
class FakeAuthRepositoryWithLogoutError extends FakeAuthRepository {
  @override
  Future<bool> logout() async {
    throw Exception('Logout Error');
  }
}

void main() {
  group('HomeViewModel', () {
    late ProviderContainer container;
    late HomeViewModel viewModel;

    setUp(() {
      container = ProviderContainer(
        overrides: [
          issInfoRepositoryProvider.overrideWithValue(FakeIssInfoRepository()),
          authRepositoryProvider.overrideWithValue(FakeAuthRepository()),
        ],
      );
      viewModel = container.read(homeViewModelProvider.notifier);
    });

    test('fetchIssInfo should update state with ISS data on success', () async {
      // Call the method
      await viewModel.fetchIssInfo();

      // Verify the state
      final asyncState = container.read(homeViewModelProvider);
      expect(asyncState, isA<AsyncData<HomeState>>());

      // Unwrap the AsyncValue to access the actual state
      final state = asyncState.value;
      expect(state, isA<HomeStateNewIssData>());
      expect((state as HomeStateNewIssData).issInfo?.latitude, 0.0);
      expect(state.issInfo?.longitude, 0.0);
      expect(state.issInfo?.country, 'Test Country');
    });

    test('signOut should return true on success', () async {
      // Call the method
      final result = await viewModel.signOut();

      // Verify the result
      expect(result, isTrue);
    });

    test('signOut should return false on failure', () async {
      // Override FakeAuthRepository to throw an error
      container = ProviderContainer(
        overrides: [
          issInfoRepositoryProvider.overrideWithValue(FakeIssInfoRepository()),
          authRepositoryProvider
              .overrideWithValue(FakeAuthRepositoryWithLogoutError()),
        ],
      );
      viewModel = container.read(homeViewModelProvider.notifier);

      // Call the method
      final result = await viewModel.signOut();

      // Verify the result
      expect(result, isFalse);
    });
  });
}
