/// Custom exception for ISS info-related errors.
class IssInfoException implements Exception {
  final String message;

  const IssInfoException(this.message);

  @override
  String toString() => message;
}
