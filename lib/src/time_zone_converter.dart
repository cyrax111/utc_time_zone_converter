import 'time_zone.dart';

extension TimeZoneConverterDateTimeExtension on DateTime {
  /// Converts current [DateTime] to a new [timeZone].
  DateTime toTimeZone(TimeZone timeZone) {
    if (isUtc) {
      return add(timeZone.offset);
    } else {
      return toUtc().add(timeZone.offset);
    }
  }

  /// Returns local time taking into account the new updated time zone.
  ///
  /// If you have [DateTime] local time and time zone was changed on a device then
  /// timeZoneOffset would be corrected automatically but toLocal() still returned old value.
  /// To avoid this issue, one can use toUpdatedLocal(), which converts local time with updated
  /// time zone.
  DateTime toUpdatedLocal() {
    if (isUtc) {
      return toLocal();
    } else {
      return toUtc().add(timeZoneOffset).copyWith(isUtc: false);
    }
  }
}
