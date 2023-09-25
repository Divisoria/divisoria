import 'failures.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage =
    'Cache Failure probably no data on the cache.';
const String unexpectedFailureMessage = 'Unexpected Failure';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case CacheFailure:
      return cacheFailureMessage;
    default:
      return unexpectedFailureMessage;
  }
}
