enum TimeInterval { last4Weeks, last6Months, allTime }

extension TimeIntervalExtension on TimeInterval {
  String get apiName {
    switch (this) {
      case TimeInterval.last4Weeks:
        return "short_term";
      case TimeInterval.last6Months:
        return "medium_term";
      case TimeInterval.allTime:
        return "long_term";
    }
  }
}